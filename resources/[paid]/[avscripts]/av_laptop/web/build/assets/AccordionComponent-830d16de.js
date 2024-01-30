import{c as D,b as M,u as v,s as I,r as m,j as e,f as w,ah as P,ai as S,aj as R,T as F,ag as N,e as O,A as B}from"./index-4ee73d63.js";import{M as A}from"./ModalMenu-ee170368.js";import{T as u}from"./Tooltip-555ed2b2.js";import{T as L}from"./Table-44f5c637.js";import{I as $}from"./Indicator-63f4ca3e.js";import{B as k}from"./Badge-c85d518e.js";import{A as y}from"./Accordion-219f390d.js";import{M as f}from"./Menu-66d6d39d.js";import{I as E}from"./IconTrash-394ce158.js";var G=D("dots","IconDots",[["path",{d:"M5 12m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0",key:"svg-0"}],["path",{d:"M12 12m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0",key:"svg-1"}],["path",{d:"M19 12m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0",key:"svg-2"}]]),H=D("map-pin-search","IconMapPinSearch",[["path",{d:"M14.916 11.707a3 3 0 1 0 -2.916 2.293",key:"svg-0"}],["path",{d:"M11.991 21.485a1.994 1.994 0 0 1 -1.404 -.585l-4.244 -4.243a8 8 0 1 1 13.651 -5.351",key:"svg-1"}],["path",{d:"M18 18m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0",key:"svg-2"}],["path",{d:"M20.2 20.2l1.8 1.8",key:"svg-3"}]]);const g={marginRight:"10px"},q=({permissions:s,element:r})=>{const i=M(),{lang:t}=v(I),[c,d]=m.useState(!1),[x,p]=m.useState({}),h=(a,o)=>{o=="rent"&&p({title:t.realestate.rent_header,options:[{name:"playerId",icon:"fa-solid fa-user-plus",title:t.realestate.player_id,type:"number"},{name:"name",icon:"fa-solid fa-id-card",title:t.realestate.client_name,type:"text"},{name:"phone",icon:"fa-solid fa-square-phone-flip",title:t.realestate.client_phone,type:"number"},{name:"days",icon:"fa-solid fa-calendar-days",title:t.realestate.days,type:"number"},{name:"money",icon:"fa-solid fa-hand-holding-dollar",title:t.realestate.price,type:"number"}],button:"Confirm",extraData:{event:"rentProperty",element:a}}),o=="renew"&&p({title:t.realestate.renew_header,options:[{name:"playerId",icon:"fa-solid fa-user-plus",title:t.realestate.player_id,type:"number"},{name:"days",icon:"fa-solid fa-calendar-days",title:t.realestate.days,type:"number"},{name:"money",icon:"fa-solid fa-hand-holding-dollar",title:t.realestate.price,type:"number"}],button:"Confirm",extraData:{event:"renew",element:a}}),o=="password"&&p({title:t.realestate.password_header,options:[{name:"password",type:"info",description:t.realestate.reset_password,style:{textAlign:"center"}}],button:"Confirm",extraData:{event:"resetPassword",element:a}}),o=="owner"&&p({title:t.realestate.remove_owner_header,options:[{name:"owner",type:"info",description:t.realestate.remove_property,style:{textAlign:"center"}}],button:"Confirm",extraData:{event:"removeOwner",element:a}}),o=="delete"&&p({title:t.realestate.delete_header,options:[{name:"delete",type:"info",description:t.realestate.delete_property,style:{textAlign:"center"}}],button:"Confirm",extraData:{event:"deleteProperty",element:a}}),d(!0)},b=async a=>{var o;if(d(!1),(o=a==null?void 0:a.extraData)!=null&&o.event){const l=await w("av_realestate",a.extraData.event,a);if(l.type=="storages"){i(P(l.data));return}if(l.type=="motels"){i(S(l.data));return}if(l.type=="houses"){i(R(l.data));return}}};return e.jsxs("div",{children:[c&&e.jsx(A,{callback:b,data:x}),!r.customer_identifier&&e.jsx(u,{label:"Rent Property",children:e.jsx("i",{id:"storage-icons",className:"fa-solid fa-user-plus",style:g,onClick:()=>{h(r,"rent")}})}),r.customer_identifier&&e.jsx(e.Fragment,{children:e.jsx(u,{label:"Renew",children:e.jsx("i",{id:"storage-icons",className:"fa-regular fa-calendar-plus",style:g,onClick:()=>{h(r,"renew")}})})}),r.customer_identifier&&e.jsx(e.Fragment,{children:e.jsx(u,{label:"Remove Owner",children:e.jsx("i",{id:"storage-icons",className:"fa-solid fa-user-slash",style:g,onClick:()=>{h(r,"owner")}})})}),r.type=="storages"&&e.jsx(e.Fragment,{children:e.jsx(u,{label:"Reset Password",children:e.jsx("i",{id:"storage-icons",className:"fa-solid fa-key",style:g,onClick:()=>{h(r,"password")}})})}),s.deleteStorage&&e.jsx(u,{label:"Delete Property",onClick:()=>{h(r,"delete")},children:e.jsx("i",{id:"storage-icons",className:"fa-regular fa-trash-can"})})]})},J=({elements:s,permissions:r})=>{const i=s.map(t=>{var c,d,x;return e.jsxs("tr",{children:[e.jsx("td",{children:t.name}),e.jsx("td",{children:t.customer}),e.jsx("td",{children:t.phone}),e.jsx("td",{children:t.initial}),e.jsx("td",{style:{color:(c=t==null?void 0:t.nextDate)!=null&&c.color?(d=t==null?void 0:t.nextDate)==null?void 0:d.color:"white"},children:(x=t==null?void 0:t.nextDate)==null?void 0:x.date}),e.jsx("td",{children:`$${t.price}`}),e.jsx("td",{children:e.jsx(q,{permissions:r,element:t})})]},t.name)});return e.jsxs(L,{children:[e.jsx("thead",{children:e.jsxs("tr",{children:[e.jsx("th",{children:"Property"}),e.jsx("th",{children:"Customer"}),e.jsx("th",{children:"Customer Phone"}),e.jsx("th",{children:"Initial Date"}),e.jsx("th",{children:"Next Payment"}),e.jsx("th",{children:"Suggested Price"}),e.jsx("th",{children:"Actions"})]})}),e.jsx("tbody",{children:i})]})},K=({data:s})=>e.jsxs("div",{style:{display:"inline-flex",width:"100%",alignContent:"center",alignItems:"center"},children:[e.jsx($,{disabled:s.expired==0,color:"#BF3F3F",label:s.expired,size:"14px",position:"middle-end",processing:!0,offset:-15,children:e.jsx(F,{order:5,truncate:!0,children:s.label})}),e.jsxs("span",{style:{display:"flex",marginLeft:"auto"},children:[e.jsx(k,{color:"blue.1",size:"sm",children:`Total: ${s.total}`}),e.jsx(k,{color:"teal.1",size:"sm",style:{marginLeft:"10px"},children:`Available: ${s.available}`})]})]}),se=({data:s,type:r})=>{const i=M(),{lang:t}=v(I),{permissions:c}=v(N),[d,x]=m.useState(!1),[p,h]=m.useState({}),[b,a]=m.useState(!1),o=()=>{a(!0)},l=n=>{h({title:"Delete Group",options:[{type:"info",description:t.realestate.delete_confirmation}],button:"Confirm",extraData:{event:"deleteGroup",data:n}}),x(!0)},T=n=>{w("av_realestate","gps",n)},z=async n=>{var C,_;if((C=n==null?void 0:n.extraData)!=null&&C.event){const j=await w("av_realestate","deleteGroup",(_=n==null?void 0:n.extraData)==null?void 0:_.data);if(j.type=="storages"){i(P(j.data));return}if(j.type=="motels"){i(S(j.data));return}}};return e.jsxs(e.Fragment,{children:[d&&e.jsx(A,{callback:z,data:p}),e.jsx(y,{radius:"0px",variant:"separated",chevronPosition:"left",children:e.jsxs(y.Item,{value:"flexibility",children:[e.jsx(f,{shadow:"md",position:"left",opened:b,onClose:()=>{a(!1)},withinPortal:!0,withArrow:!0,children:e.jsxs(O,{sx:{display:"flex",alignItems:"center"},children:[e.jsx(y.Control,{children:e.jsx(K,{data:s})}),e.jsx(f.Target,{children:e.jsx(B,{size:"lg",onClick:o,children:e.jsx(G,{size:"1rem"})})}),e.jsxs(f.Dropdown,{style:{display:"flex",position:"absolute",zIndex:"99"},children:[e.jsx(f.Label,{children:t.realestate.group_options}),e.jsx(f.Item,{icon:e.jsx(H,{size:14}),onClick:()=>{T(s.coords)},children:t.realestate.set_gps}),c.deleteStorage&&e.jsx(f.Item,{color:"red",icon:e.jsx(E,{size:14}),onClick:()=>{l(s)},children:t.realestate.delete_group})]})]})}),e.jsx(y.Panel,{children:e.jsx(J,{elements:s==null?void 0:s.data,type:r,permissions:c})})]})})]})};export{se as A};
