let allProducts = [];
let filteredProducts = [];

async function getJSON(url){
  const response = await fetch(url);
  if(!response.ok) throw new Error(`${url}: ${response.status}`);
  return response.json();
}

async function loadDashboard(){
  setApiStatus("checking");
  try{
    const [summary, products] = await Promise.all([
      getJSON("/inventory/summary"),
      getJSON("/products")
    ]);
    allProducts = Array.isArray(products) ? products : [];
    // The API calls succeeded. Mark the API online BEFORE rendering
    // the dashboard so a frontend rendering error is not mistaken
    // for an API/database failure.
    setApiStatus("online");

    try {
      updateSummary(summary);
      applyFilters();
    } catch (renderError) {
      console.error("Dashboard rendering error:", renderError);
    }

  }catch(error){
    console.error("API request error:", error);
    setApiStatus("offline");
  }
}

function setApiStatus(state){
  const el=document.getElementById("apiStatus");
  if(state==="online"){el.textContent="● API Online • PostgreSQL Connected";el.className="api-status online";}
  else if(state==="offline"){el.textContent="● API Offline";el.className="api-status offline";}
  else{el.textContent="● Checking API…";el.className="api-status checking";}
}

function updateSummary(summary){
  const total=Number(summary.total_products)||0;
  const healthy=Number(summary.healthy_products)||0;
  const critical=Number(summary.critical_products)||0;
  const low=Number(summary.low_stock_products)||0;
  const warning=Number(summary.warning_products)||0;
  const value=Number(summary.total_inventory_value)||0;

  text("criticalNumber",critical);
  text("riskCount",critical+low);
  text("unitsInStock",allProducts.reduce((s,p)=>s+(Number(p.stock)||0),0).toLocaleString("en-IN"));
  text("stockValue",money(value));
  text("healthPercent",`${total?Math.round(healthy/total*100):0}%`);
  text("reorderCount",allProducts.filter(p=>p.reorder_required).length);
  text("reorderUnits",allProducts.reduce((s,p)=>s+(Number(p.recommended_quantity)||0),0).toLocaleString("en-IN"));
  text("reorderRate",`${total?Math.round(allProducts.filter(p=>p.reorder_required).length/total*100):0}%`);

  const health=total?Math.round(healthy/total*100):0;
  const gauge=document.getElementById("healthGauge");
  gauge.style.background=`conic-gradient(from 270deg,var(--green) ${health*1.8}deg,#4e5279 0deg,#4e5279 180deg,transparent 180deg)`;

  const utilization=Math.min(100,Math.round(Math.min(1,(allProducts.reduce((s,p)=>s+(Number(p.stock)||0),0))/1500)*100));
  text("utilization",`${utilization}%`);
  document.getElementById("utilizationBar").style.width=`${utilization}%`;
  text("criticalMessage",critical?`${critical} tyre SKU${critical===1?"":"s"} need immediate attention.`:"No critical tyre stock detected.");
  document.getElementById("criticalBadge").style.opacity=critical?1:.45;
}

function applyFilters(){
  const q=document.getElementById("searchInput").value.trim().toLowerCase();
  const cat=document.getElementById("categoryFilter").value;
  const status=document.getElementById("statusFilter").value;

  filteredProducts=allProducts.filter(p=>{
    const hay=[p.brand,p.model,p.tyre_size,p.category,p.vehicle_compatibility].join(" ").toLowerCase();
    return (!q||hay.includes(q)) && (cat==="ALL"||p.category===cat) && (status==="ALL"||p.status===status);
  });

  renderStockout();
  renderTable();
  renderBars();
}

function renderStockout(){
  const list=document.getElementById("stockoutList");
  const items=[...filteredProducts].sort((a,b)=>(Number(a.days_remaining)||999)-(Number(b.days_remaining)||999)).slice(0,12);
  list.innerHTML=items.map(p=>`
    <div class="risk-row" data-id="${p.product_id}" tabindex="0">
      <div class="risk-name"><strong>${esc(p.brand)} ${esc(p.model)}</strong><span>${esc(p.tyre_size)} · ${esc(p.category)}</span></div>
      <div class="risk-days">${days(p.days_remaining)}<small>days</small></div>
    </div>`).join("") || `<div class="risk-row"><div class="risk-name"><strong>No matching tyres</strong><span>Change your filters</span></div></div>`;
  list.querySelectorAll(".risk-row[data-id]").forEach(row=>row.addEventListener("click",()=>openDetails(row.dataset.id)));
}

function renderTable(){
  const body=document.getElementById("inventoryTable");
  const items=[...filteredProducts].sort((a,b)=>(Number(b.stock)||0)-(Number(a.stock)||0));
  text("tableCount",`${items.length} SKUs`);
  body.innerHTML=items.map(p=>{
    const value=(Number(p.stock)||0)*(Number(p.price)||0);
    const cls=p.status==="CRITICAL"?"stock-critical":p.status==="LOW"?"stock-low":"stock-good";
    return `<tr data-id="${p.product_id}" tabindex="0">
      <td><div class="tyre-name"><strong>${esc(p.brand)} ${esc(p.model)}</strong><span>${esc(p.tyre_size)} · ${esc(p.category)}</span></div></td>
      <td class="${cls}">${Number(p.stock)||0}</td>
      <td>${Number(p.daily_sales)||0}</td>
      <td>${money(p.price)}</td>
      <td>${compactMoney(value)}</td>
    </tr>`;
  }).join("") || `<tr><td colspan="5">No matching inventory.</td></tr>`;
  body.querySelectorAll("tr[data-id]").forEach(row=>row.addEventListener("click",()=>openDetails(row.dataset.id)));
}

function renderBars(){
  const counts={};
  filteredProducts.filter(p=>p.reorder_required).forEach(p=>counts[p.brand]=(counts[p.brand]||0)+(Number(p.recommended_quantity)||0));
  const rows=Object.entries(counts).sort((a,b)=>b[1]-a[1]).slice(0,6);
  const max=Math.max(1,...rows.map(x=>x[1]));
  document.getElementById("brandBars").innerHTML=rows.map(([brand,n])=>`
    <div class="bar-row"><span>${esc(brand)}</span><div class="bar-track"><div class="bar-fill" style="width:${Math.round(n/max*100)}%"></div></div><strong>${n}</strong></div>
  `).join("") || `<div class="muted-count">No reorder action for current filters.</div>`;
}

function openDetails(id){
  const p=allProducts.find(x=>String(x.product_id)===String(id));
  if(!p)return;
  text("modalTitle",`${p.brand} ${p.model}`);
  document.getElementById("modalBody").innerHTML=[
    ["Tyre size",p.tyre_size],["Type",p.category],["Stock",p.stock],["Daily sales",p.daily_sales],
    ["Days remaining",days(p.days_remaining)],["Unit price",money(p.price)],["Inventory value",money((Number(p.stock)||0)*(Number(p.price)||0))],
    ["Status",p.status],["Recommended order",p.recommended_quantity],["Vehicle compatibility",p.vehicle_compatibility]
  ].map(([k,v])=>`<div class="detail"><span>${esc(k)}</span><strong>${esc(v)}</strong></div>`).join("");
  document.getElementById("detailModal").classList.remove("hidden");
}

function text(id,v){const e=document.getElementById(id);if(e)e.textContent=v;}
function money(v){return "₹"+Number(v||0).toLocaleString("en-IN",{maximumFractionDigits:0});}
function compactMoney(v){const n=Number(v||0);if(n>=10000000)return "₹"+(n/10000000).toFixed(1)+"Cr";if(n>=100000)return "₹"+(n/100000).toFixed(1)+"L";if(n>=1000)return "₹"+(n/1000).toFixed(1)+"K";return money(n);}
function days(v){const n=Number(v);return Number.isFinite(n)?n.toFixed(1):"∞";}
function esc(v){return String(v??"").replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;").replace(/'/g,"&#039;");}

document.getElementById("searchInput").addEventListener("input",applyFilters);
document.getElementById("categoryFilter").addEventListener("change",applyFilters);
document.getElementById("statusFilter").addEventListener("change",applyFilters);
document.getElementById("refreshBtn").addEventListener("click",loadDashboard);
document.getElementById("closeModal").addEventListener("click",()=>document.getElementById("detailModal").classList.add("hidden"));
document.getElementById("detailModal").addEventListener("click",e=>{if(e.target.id==="detailModal")e.currentTarget.classList.add("hidden");});

loadDashboard();
