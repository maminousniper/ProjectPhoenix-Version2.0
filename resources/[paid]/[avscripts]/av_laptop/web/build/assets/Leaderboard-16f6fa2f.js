import{u as z,s as P,r as s,j as t,e as E,L as j,K as w,C as A,f as T}from"./index-233adb6c.js";import{u as B,F as R,I as _}from"./index-fc19bfb0.js";import{s as b}from"./sortBy-2ce58a95.js";import{T as D}from"./TextInput-ab4d4571.js";const F=({profiles:r,photos:n})=>{const{lang:o}=z(P),[a,d]=s.useState({height:200,size:10}),[i,x]=s.useState(!0),[c,m]=s.useState(1),[l,v]=s.useState({columnAccessor:"name",direction:"asc"}),[p,u]=s.useState(b(r,"name")),[h,S]=s.useState(""),[g]=B(h,200),C=r.slice(0,a.size);return s.useEffect(()=>{(async()=>{const y=(c-1)*a.size,L=y+a.size;u(r.slice(y,L)),setTimeout(()=>{x(!1)},250)})();const f=window.innerHeight;d({...a,height:f/2})},[r]),s.useEffect(()=>{u(C.filter(({name:e})=>!(g!==""&&!`${e} `.toLowerCase().includes(g.trim().toLowerCase()))))},[g]),s.useEffect(()=>{const e=b(r,l.columnAccessor);u(l.direction==="desc"?e.reverse():e)},[l]),s.useEffect(()=>{const e=(c-1)*a.size,f=e+a.size;u(r.slice(e,f))},[c]),t.jsx(E,{mt:-1,children:i?t.jsx("div",{style:{position:"relative",width:"100%",height:"100%"},children:t.jsx(j,{visible:i,overlayBlur:2,overlayColor:"rgba(20, 21, 23, 1)"})}):t.jsx(R,{withBorder:!0,borderRadius:2,height:a.height,style:{backgroundColor:"#1A1B1E",borderColor:"rgba(255,255,255,0.13"},records:p,columns:[{accessor:"",render:e=>t.jsx(w,{src:e.photo,alt:e.name,size:50,radius:10}),width:65},{accessor:"name",render:({name:e})=>`${e}`,filter:t.jsx(D,{label:o.business.search_user,description:o.business.search_user_description,placeholder:o.business.search,icon:t.jsx(_,{size:16}),value:h,onChange:e=>S(e.currentTarget.value)}),filtering:h!=="",sortable:!0},{title:o.racing.races_won,accessor:"wins",sortable:!0},{title:o.racing.total_races,accessor:"races",sortable:!0},{title:o.racing.crew,accessor:"crewLabel",sortable:!0,render:e=>t.jsx(t.Fragment,{children:e.crew&&n[e.crew]?t.jsxs("div",{style:{display:"inline-flex",alignContent:"right",textAlign:"right",justifyContent:"right",alignItems:"center"},children:[t.jsx(A,{children:e.crewLabel}),t.jsx(w,{src:n[e.crew].photo,alt:e.name,size:50,radius:10,ml:10})]}):t.jsx(t.Fragment,{})}),width:240}],sortStatus:l,onSortStatusChange:v,totalRecords:r.length,recordsPerPage:a.size,page:c,onPageChange:e=>m(e),paginationColor:"cyan.7"})})};const k=()=>{const[r,n]=s.useState(!0),[o,a]=s.useState([]),[d,i]=s.useState({});return s.useEffect(()=>{(async()=>{const c=await T("av_racing","getPlayersLeaderboard");a(c.players),i(c.crews),setTimeout(()=>{n(!1)},300)})()},[]),t.jsx(t.Fragment,{children:r?t.jsx("div",{style:{position:"absolute",width:"100%",height:"100%"},children:t.jsx(j,{visible:r,overlayBlur:2,overlayColor:"rgba(20, 21, 23, 1)"})}):t.jsx("div",{className:"racing-leaderboard-container",children:t.jsx(F,{profiles:o,photos:d})})})};export{k as default};
