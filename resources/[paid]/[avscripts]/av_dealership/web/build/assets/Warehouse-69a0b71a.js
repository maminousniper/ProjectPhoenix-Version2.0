import{j as y,q as E,s as M,r as o,z as L,l,B as A,o as m}from"./index-dafeadfa.js";import{H as N,F as T}from"./WarehouseCard-5972a0cf.js";import{M as q}from"./ModalMain-d572d4b6.js";import{G as g}from"./Grid-1e8beaee.js";import"./Search-a972d158.js";import"./IconSearch-96976665.js";import"./SelectMenu-6299afef.js";import"./Menu-4bcfc8b1.js";import"./IconChevronDown-2f2dc9b5.js";import"./IconSortDescendingLetters-e096bb00.js";import"./Paper-1e316dd2.js";import"./TextInput-22038d77.js";const Y=()=>{const{lang:s}=y(E),{money:p,name:i}=y(M),[x,v]=o.useState(!1),[u,h]=o.useState([]),[w,d]=o.useState([]),[_,f]=o.useState(!1),[j,b]=o.useState({}),[k,S]=o.useState([]);L("removeStock",t=>{const e=[...u],r=e.findIndex(n=>n.model===t);r!==-1&&(e[r].stock-=1,h(e),d(e.slice(0,100)))});const V=t=>{const e=Object.values(u).filter(r=>t?r.category.toLowerCase().includes(t.toLowerCase()):!0);d(e.slice(0,100))},D=t=>{const e=Object.values(u).filter(r=>t===""?!0:r.label.toLowerCase().includes(t.toLowerCase()));d(e.slice(0,100))},C=(t,e)=>{switch(t){case"order":b({title:s.place_order,options:[{name:"vehicle",type:"text",title:s.veh_model,default:e.label,icon:"fa-regular fa-pen-to-square",disabled:!0},{name:"funds",type:"number",title:s.funds,default:p,icon:"fa-solid fa-coins",disabled:!0},{name:"price",type:"number",title:s.price_unit,default:e.basePrice,icon:"fa-solid fa-tags",disabled:!0},{name:"amount",type:"number",title:s.units,default:0,icon:"fa-solid fa-cart-plus"}],button:s.confirm_button,extraData:{event:"placeOrder",dealer:i,model:e.model,basePrice:e.basePrice,funds:p}}),f(!0);break;case"test":m("av_dealership","testDrive",{model:e.model,dealership:i});break;case"sell":b({title:s.sell_vehicle,options:[{name:"vehicle",type:"text",title:s.veh_model,default:e.label,icon:"fa-regular fa-pen-to-square",disabled:!0},{name:"basePrice",type:"number",title:s.base_price,default:e.basePrice,icon:"fa-solid fa-tags",disabled:!0},{name:"playerId",type:"number",title:s.player_id,default:0,icon:"fa-solid fa-user"},{name:"phone",type:"number",title:s.customer_phone,default:0,icon:"fa-solid fa-phone"},{name:"price",type:"number",title:s.price,default:0,icon:"fa-solid fa-file-invoice-dollar"},{name:"payments",type:"number",title:s.payments,default:1,icon:"fa-solid fa-calendar-days",subtitle:"(max 12)"},{name:"garage",type:"select",title:s.garage,icon:"fa-solid fa-warehouse",options:k,searchable:!0},{type:"info",description:s.sell_confirmation,style:{marginTop:"10px",fontSize:"14px",fontWeight:"500",textAlign:"center"}}],button:s.confirm_button,extraData:{event:"sellVehicle",dealer:i,model:e.model,label:e.label,funds:p,basePrice:e.basePrice}}),f(!0);break}},O=t=>{var e;f(!1),(e=t==null?void 0:t.extraData)!=null&&e.event&&m("av_dealership",t.extraData.event,t)};return o.useEffect(()=>{(async()=>{try{const e=await m("av_dealership","getVehicles",i);v(e.testDrive),S(e.allGarages);const n=Object.values(e.allVehicles).filter(a=>a.dealerships.includes(i)).map(a=>({...a})).map(a=>{const c=e.vehicles.find(P=>P.model===a.model);return c&&c.stock!==void 0?a={...a,stock:c.stock}:a={...a,stock:0},a}).sort((a,c)=>c.stock-a.stock),G={...e.allVehicles};n.forEach(a=>{G[a.model]={...a}}),d(n.slice(0,100)),h(n)}catch(e){console.error("Error fetching or processing data:",e)}})()},[]),l.jsxs("div",{children:[_&&l.jsx(q,{data:j,callback:O}),l.jsx(N,{vehicles:u,handleCategory:V,handleSearch:D}),l.jsx(A,{className:"warehouse-container",style:{height:window.innerHeight/2.05},children:l.jsx(g,{columns:2,children:w.map((t,e)=>l.jsx(g.Col,{className:"warehouse-card",children:l.jsx(T,{data:t,onSelect:C,driveTestOpen:x,lang:s},e)},e))})})]})};export{Y as default};
