import{c as B,j as s,u as T,s as P,T as g,B as _,y as D,z as E,A as z,r as k,L as F,f as L}from"./index-28ac6c93.js";import{T as p}from"./Tabs-a4d6cbdd.js";import{I as H}from"./IconTrash-10d30b72.js";import{G as N}from"./Grid-d6e08076.js";import{F as M}from"./Flex-a153c916.js";import{A as R}from"./AppShell-ca867994.js";import{H as G}from"./Header-5608f27c.js";import{N as W}from"./Navbar-3d1ae847.js";var V=B("plus","IconPlus",[["path",{d:"M12 5l0 14",key:"svg-0"}],["path",{d:"M5 12l14 0",key:"svg-1"}]]);const q=({tabOptions:a=[],setCurrentTab:c})=>{var r;const t=e=>{const i=a.find(d=>d.name===e);c(i)};return s.jsx("div",{className:"header",children:s.jsx(p,{onTabChange:e=>{t(e)},radius:"0px",defaultValue:(r=a[0])==null?void 0:r.name,sx:{".mantine-Tabs-tabsList":{border:"none",borderColor:"none"}},children:s.jsx(p.List,{children:a==null?void 0:a.map((e,i)=>s.jsx(p.Tab,{value:e.name,children:e.label},i))})})})},J=({total:a,products:c,handleBuy:t,handleRemove:r})=>{const{lang:e}=T(P);return s.jsxs("div",{className:"cart-container",children:[s.jsx("span",{className:"cart-header",children:s.jsx(g,{order:3,children:e.dark_market.shopping_cart})}),s.jsx("div",{className:"cart-list",children:c.map((i,d)=>s.jsxs("div",{className:"cart-product",children:[s.jsx(g,{order:6,children:s.jsx("li",{children:`${i.amount}x ${i.label} - $${i.price*i.amount}`})}),s.jsx(H,{size:18,style:{marginTop:"2px"},onClick:()=>{r(i)}})]},d))}),s.jsxs("div",{className:"cart-footer",children:[s.jsx(g,{order:4,children:`${e.dark_market.total} $${a}`}),s.jsx(_,{sx:{marginLeft:"20px"},onClick:t,disabled:!c[0],children:e.dark_market.buy})]})]})},K=({currentTab:a,handleAdd:c})=>{var r;const{inventoryPath:t}=T(D);return s.jsx("div",{className:"products-container",children:s.jsx("div",{className:"products-list",children:s.jsx(N,{columns:3,children:(r=a==null?void 0:a.items)==null?void 0:r.map(e=>s.jsxs(N.Col,{className:"product-card",children:[s.jsx("span",{className:"product-header",children:s.jsx(g,{order:4,children:e==null?void 0:e.label})}),s.jsx(E,{height:100,width:100,mx:"auto",radius:"md",src:t?`${`https://cfx-nui-${t}${e==null?void 0:e.name}.png`}`:`blackmarket/${e==null?void 0:e.name}.png`,alt:e==null?void 0:e.name,sx:{marginTop:"10px",backgroundColor:"transparent"},withPlaceholder:!0}),s.jsxs("span",{className:"product-footer",children:[s.jsxs(M,{justify:"flex-start",align:"flex-end",direction:"column",wrap:"wrap-reverse",children:[s.jsxs(g,{order:6,children:[s.jsx("a",{children:"Price:"})," ",s.jsx("a",{style:{fontWeight:"400"},children:`${e==null?void 0:e.price} ${e==null?void 0:e.accountLabel}`})]}),s.jsxs(g,{order:6,children:[s.jsx("a",{children:"Stock:"})," ",s.jsx("a",{style:{fontWeight:"400"},children:e==null?void 0:e.stock})]})]}),s.jsx(z,{sx:{display:"inline-flex",backgroundColor:"#1971C2",":hover":{backgroundColor:"#1C7ED6"}},onClick:()=>{c(e)},disabled:(e==null?void 0:e.stock)<=0,children:s.jsx(V,{size:"1.125rem"})})]})]}))})})})},S=(a,c)=>a.map(r=>{if(r.name===c){const e=r.stock-1;return{...r,stock:e}}return r});const ae=()=>{const[a,c]=k.useState([]),[t,r]=k.useState([]),[e,i]=k.useState([]),[d,$]=k.useState(!0),[v,y]=k.useState(0),b=n=>{const o=n.name;if(e.find(h=>h.name===o)){const h=e.map(l=>{if(l.name===o){const C=l.amount+1;return y(v+n.price),{...l,amount:C}}return l}),f=t.items.map(l=>{if(l.name===o){const C=l.stock-1;return{...l,stock:C}}return l});i(h),r({...t,items:f});const m=a.findIndex(l=>l.name===t.name),j=[...a[m].items],u=S(j,o),x=[...a];x[m].items=u,c(x)}else{const h=t.items.map(x=>{if(x.name===o){const l=x.stock-1;return{...x,stock:l}}return x});y(v+n.price),i([...e,{name:o,label:n.label,price:n.price,amount:1,account:n.account,category:t.name}]),r({...t,items:h});const f=a.findIndex(x=>x.name===t.name),m=[...a[f].items],j=S(m,o),u=[...a];u[f].items=j,c(u)}},I=async()=>{await L("av_blackmarket","handleBuy",e)=="ok"&&(i([]),y(0))},A=n=>{if(e.find(w=>w.name===n.name)){const w=e.filter(m=>m.name!==n.name),h=n.price*n.amount,f=t.items.map(m=>{if(m.name===n.name){const j=m.stock+n.amount;return{...m,stock:j}}return m});r({...t,items:f}),i(w),y(v-h)}};return k.useEffect(()=>{(async()=>{const o=await L("av_blackmarket","fetchData");o[0]&&(c(o),r(o[0])),setTimeout(()=>{$(!1)},500)})()},[]),s.jsx(s.Fragment,{children:d?s.jsx("div",{style:{position:"absolute",width:"100%",height:"100%"},children:s.jsx(F,{visible:d,overlayBlur:2,overlayColor:"rgba(20, 21, 23, 1)"})}):s.jsx(R,{header:s.jsx(G,{height:70,children:s.jsx(q,{tabOptions:a,setCurrentTab:r})}),navbar:s.jsx(W,{width:{base:250},height:"100%",fixed:!1,withBorder:!1,children:s.jsx(J,{total:v,products:e,handleBuy:I,handleRemove:A})}),styles:n=>({main:{backgroundColor:n.colorScheme==="dark"?n.colors.dark[8]:n.colors.gray[0],padding:"10px",marginTop:"75px"}}),sx:{marginTop:"-40px"},children:s.jsx(K,{currentTab:t,handleAdd:b})})})};export{ae as default};
