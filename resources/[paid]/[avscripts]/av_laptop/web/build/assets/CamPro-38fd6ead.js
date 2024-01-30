import{c as I,u as w,s as N,y as L,r as c,C as O,j as e,N as G,E as A,D as B,T as E,f as b,z as W,B as $,L as F}from"./index-28ac6c93.js";import{M as T}from"./ModalMenu-a55b458a.js";import{M as l}from"./Menu-6531da33.js";import{I as z}from"./IconTrash-10d30b72.js";import{T as V}from"./Timer-a1d064f3.js";import{G as D}from"./Grid-d6e08076.js";import{C}from"./Card-3dfeee0b.js";import{A as q}from"./AppShell-ca867994.js";import{N as H}from"./Navbar-3d1ae847.js";var R=I("arrows-left-right","IconArrowsLeftRight",[["path",{d:"M21 17l-18 0",key:"svg-0"}],["path",{d:"M6 10l-3 -3l3 -3",key:"svg-1"}],["path",{d:"M3 7l18 0",key:"svg-2"}],["path",{d:"M18 20l3 -3l-3 -3",key:"svg-3"}]]),J=I("camera-plus","IconCameraPlus",[["path",{d:"M12 20h-7a2 2 0 0 1 -2 -2v-9a2 2 0 0 1 2 -2h1a2 2 0 0 0 2 -2a1 1 0 0 1 1 -1h6a1 1 0 0 1 1 1a2 2 0 0 0 2 2h1a2 2 0 0 1 2 2v3.5",key:"svg-0"}],["path",{d:"M16 19h6",key:"svg-1"}],["path",{d:"M19 16v6",key:"svg-2"}],["path",{d:"M9 13a3 3 0 1 0 6 0a3 3 0 0 0 -6 0",key:"svg-3"}]]);const K=({camGroups:x=[],getCameras:p,setGroupsList:v})=>{const{lang:o}=w(N),{serial:a}=w(L),[i,u]=c.useState("all"),[f,d]=c.useState(!1),[y,n]=c.useState(999),[m,g]=c.useState(),k=O(()=>n(999),["mouseup","touchend"]),P=s=>{i==s?(u("all"),p("all")):(u(s),p(s))},S=(s,r)=>{s.preventDefault(),n(r)},_=s=>{n(999),g({title:o.camPro.share_camera,options:[{name:"playerId",icon:"fa-solid fa-user",title:o.camPro.player_id,type:"number"}],button:o.camPro.share,extraData:{event:"shareGroup",group:s}}),d(!0)},M=()=>{g({title:o.camPro.add_group,button:o.camPro.save,options:[{name:"groupName",icon:"fa-solid fa-video",title:o.camPro.group_name,type:"text",description:""}],extraData:{event:"addGroup",serial:a}}),d(!0)},t=async s=>{if(d(!1),!s)return;const r=await b("av_cameras",s.extraData.event,s);r!=="ok"&&v(r.groups)},h=async s=>{n(999),g({title:`${o.camPro.delete} ${s.label}`,button:"Confirm",options:[{type:"info",description:o.camPro.delete_confirmation,size:6,style:{textAlign:"center"}}],extraData:{event:"deleteGroup",name:s.name,serial:a}}),d(!0)};return e.jsxs("div",{className:"cam-navbar",children:[f&&e.jsx(T,{callback:t,data:m}),e.jsx("span",{className:"navbar-header",children:e.jsx(G,{label:o.camPro.new_group,icon:e.jsx(J,{size:"1rem",stroke:1.5,style:{position:"absolute"}}),rightSection:e.jsx(A,{size:"1rem",stroke:1.5,style:{position:"absolute",opacity:"0.5"}}),onClick:M})}),e.jsx(B,{style:{marginTop:"5px"}}),e.jsx("span",{className:"cam-groups",children:x.map((s,r)=>e.jsx(l,{shadow:"md",width:150,position:"bottom",opened:y==r,withinPortal:!0,children:e.jsxs("span",{className:"group-title",ref:k,id:s.name,style:{color:i==s.name?"rgba(200,200,200,1)":"rgba(150,150,150,0.8)",borderStyle:i==s.name?"none none none solid":"none",borderColor:i==s.name?"#339AF0":"none"},onContextMenu:j=>{S(j,r)},children:[e.jsx(l.Target,{children:e.jsx(E,{order:6,style:{width:"115px",marginLeft:"5px",overflow:"hidden",textOverflow:"ellipsis",whiteSpace:"nowrap"},onClick:()=>{P(s.name)},children:s.label})}),e.jsxs(l.Dropdown,{children:[e.jsx(l.Label,{children:o.camPro.group_options}),s.canShare&&e.jsx(l.Item,{icon:e.jsx(R,{size:14}),onClick:()=>{setTimeout(()=>{_(s)},50)},children:o.camPro.share_group}),s.canDelete&&e.jsx(l.Item,{color:"red",icon:e.jsx(z,{size:14}),onClick:()=>{h(s)},children:o.camPro.delete_group})]})]})},r))})]})},Q=({currentCameras:x,camList:p,setCamList:v,setCurrentCameras:o})=>{const{lang:a}=w(N),{serial:i}=w(L),[u,f]=c.useState(999),[d,y]=c.useState(!1),[n,m]=c.useState({title:a.camPro.share_camera,options:[{name:"playerId",icon:"fa-solid fa-user",title:a.camPro.player_id,type:"number"}],button:a.camPro.share_button,extraData:{event:"shareCam"}}),g=t=>{if(u===t){f(9999);return}f(t)},k=t=>{m({title:`${a.camPro.share_camera} '${t.name}'`,options:[{name:"playerId",icon:"fa-solid fa-user",title:a.camPro.player_id,type:"number"}],button:a.camPro.share_button,extraData:{event:"shareCam",camera:t}}),y(!0)},P=t=>{y(!1),t&&b("av_cameras",t.extraData.event,t)},S=(t,h,s)=>{t.preventDefault(),s!=="server"&&f(h)},_=t=>{const h={...t,serial:i};b("av_cameras","watch",h)},M=t=>{if(b("av_cameras","delete",{camera:t,serial:i}),x.find(r=>r.identifier===t.identifier)){const r=x.filter(j=>j.identifier!==t.identifier);o(r)}if(p.find(r=>r.identifier===t.identifier)){const r=p.filter(j=>j.identifier!==t.identifier);v(r)}};return e.jsxs("div",{className:"camera-container",children:[d&&e.jsx(T,{callback:P,data:n}),e.jsx("div",{className:"camera-list",children:e.jsx(D,{columns:2,children:x.map((t,h)=>e.jsx(l,{shadow:"md",width:150,position:"right",opened:u==h,onClose:()=>{g(999)},withinPortal:!0,withArrow:!0,children:e.jsx(D.Col,{className:"camera-card",children:e.jsxs(C,{shadow:"sm",padding:"lg",radius:"md",withBorder:!0,w:235,children:[e.jsx(C.Section,{children:e.jsx(W,{src:(t==null?void 0:t.thumbnail)&&t.thumbnail,height:160,alt:t.name,withPlaceholder:!0})}),e.jsx(C.Section,{children:e.jsx(l.Target,{children:e.jsx(G,{label:t.name,description:t.location,rightSection:t.type!=="server"&&e.jsx(A,{size:"1rem",stroke:1.5,style:{position:"absolute",opacity:"0.5"}}),onClick:s=>{S(s,h,t.type)},style:{fontWeight:"600",overflow:"hidden",textAlign:"center",whiteSpace:"nowrap",textOverflow:"ellipsis",marginRight:"auto",marginLeft:"auto"},disabled:t.type=="server"})})}),e.jsxs(l.Dropdown,{style:{display:"flex",position:"absolute",zIndex:"99"},children:[e.jsx(l.Label,{children:a.camPro.camera_options}),t.canShare&&e.jsx(l.Item,{icon:e.jsx(R,{size:14}),onClick:()=>{setTimeout(()=>{k(t)},50)},children:a.camPro.share_camera}),e.jsx(l.Item,{color:"red",icon:e.jsx(z,{size:14}),onClick:()=>{M(t)},children:a.camPro.delete_camera})]}),e.jsx(C.Section,{style:{display:"flex",width:"120%",textAlign:"center",justifyContent:"center"},children:t.type=="server"?e.jsx("a",{style:{marginRight:"5px",fontWeight:"500"},children:a.camPro.battery_full}):e.jsxs(e.Fragment,{children:[e.jsx("a",{style:{marginRight:"5px",fontWeight:"500"},children:a.camPro.battery})," ",e.jsx(V,{deadline:t.battery,expired:"Expired"})]})}),e.jsx($,{variant:"light",color:"blue",fullWidth:!0,mt:"md",radius:"md",onClick:()=>{_(t)},disabled:t.battery<=0,children:a.camPro.watch_button})]})})},h))})})]})};const re=()=>{const{serial:x}=w(L),[p,v]=c.useState(!0),[o,a]=c.useState([]),[i,u]=c.useState([]),[f,d]=c.useState(i),y=n=>{if(n=="all")d(i);else{const m=i.filter(g=>g.group.toLowerCase().includes(n));d(m)}};return c.useEffect(()=>{(async()=>{const m=await b("av_cameras","getGroups",{identifier:x});a(m.groups),u(m.cameraList),d(m.cameraList),setTimeout(()=>{v(!1)},100)})()},[]),e.jsx("div",{className:"cam-main",children:p?e.jsx("div",{style:{position:"absolute",width:"100%",height:"100%"},children:e.jsx(F,{visible:p,overlayBlur:2,overlayColor:"rgba(20, 21, 23, 1)"})}):e.jsx(q,{padding:"md",navbar:e.jsx(H,{width:{base:150},height:"100%",p:"xs",sx:{overflow:"auto"},children:e.jsx(K,{camGroups:o,getCameras:y,setGroupsList:a})}),styles:n=>({main:{backgroundColor:n.colorScheme==="dark"?n.colors.dark[8]:n.colors.gray[0]}}),children:e.jsx(Q,{camList:i,currentCameras:f,setCurrentCameras:d,setCamList:u})})})};export{re as default};
