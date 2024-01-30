import{n as X,V as g,m as n,a4 as Y,o as ee,r as w,W as re,R as _,e as R,a5 as te,a6 as ae,a as oe}from"./index-28ac6c93.js";import{g as V,u as ne,G as ie}from"./AppShell-ca867994.js";var se=Object.defineProperty,le=Object.defineProperties,de=Object.getOwnPropertyDescriptors,S=Object.getOwnPropertySymbols,pe=Object.prototype.hasOwnProperty,fe=Object.prototype.propertyIsEnumerable,$=(r,t,e)=>t in r?se(r,t,{enumerable:!0,configurable:!0,writable:!0,value:e}):r[t]=e,c=(r,t)=>{for(var e in t||(t={}))pe.call(t,e)&&$(r,e,t[e]);if(S)for(var e of S(t))fe.call(t,e)&&$(r,e,t[e]);return r},N=(r,t)=>le(r,de(t)),ce=X((r,{height:t,width:e,fixed:a,position:o,hiddenBreakpoint:i,zIndex:s,section:u,withBorder:y,layout:l})=>{const b=typeof e=="object"&&e!==null?V(e,r).reduce((d,[O,p])=>(d[`@media (min-width: ${g(O)})`]={width:n(p),minWidth:n(p)},d),{}):null,h=y?{[u==="navbar"?"borderRight":"borderLeft"]:`${n(1)} solid ${r.colorScheme==="dark"?r.colors.dark[5]:r.colors.gray[2]}`}:{};return{root:N(c(c(N(c(c({},r.fn.fontStyles()),o),{top:l==="alt"?0:(o==null?void 0:o.top)||"var(--mantine-header-height)",bottom:0,zIndex:s,height:t?n(t):l==="alt"?"auto":"calc(100vh - var(--mantine-header-height, 0rem) - var(--mantine-footer-height, 0rem))",width:e!=null&&e.base?n(e==null?void 0:e.base):"100%",position:a?"fixed":"static",boxSizing:"border-box",display:"flex",flexDirection:"column",backgroundColor:r.colorScheme==="dark"?r.colors.dark[7]:r.white}),h),b),{"&[data-hidden]":{[`@media (max-width: ${g(Y(ee({size:i,sizes:r.breakpoints}))-1)})`]:{display:"none"}}})}});const _e=ce;var me=Object.defineProperty,m=Object.getOwnPropertySymbols,k=Object.prototype.hasOwnProperty,D=Object.prototype.propertyIsEnumerable,j=(r,t,e)=>t in r?me(r,t,{enumerable:!0,configurable:!0,writable:!0,value:e}):r[t]=e,E=(r,t)=>{for(var e in t||(t={}))k.call(t,e)&&j(r,e,t[e]);if(m)for(var e of m(t))D.call(t,e)&&j(r,e,t[e]);return r},ve=(r,t)=>{var e={};for(var a in r)k.call(r,a)&&t.indexOf(a)<0&&(e[a]=r[a]);if(r!=null&&m)for(var a of m(r))t.indexOf(a)<0&&D.call(r,a)&&(e[a]=r[a]);return e};const C=w.forwardRef((r,t)=>{var e=r,{width:a,height:o,fixed:i=!1,position:s,zIndex:u,hiddenBreakpoint:y="md",hidden:l=!1,withBorder:b=!0,className:h,classNames:d,styles:O,children:p,section:f,__staticSelector:L,unstyled:Z,variant:q}=e,F=ve(e,["width","height","fixed","position","zIndex","hiddenBreakpoint","hidden","withBorder","className","classNames","styles","children","section","__staticSelector","unstyled","variant"]);const P=ne(),{classes:J,cx:K,theme:M}=_e({width:a,height:o,fixed:P.fixed||i,position:s,hiddenBreakpoint:y,zIndex:u||P.zIndex||re("app"),section:f,withBorder:b,layout:P.layout},{classNames:d,styles:O,name:L,unstyled:Z,variant:q}),Q=V(a,M).reduce((x,[T,U])=>(x[`@media (min-width: ${g(T)})`]={[`--mantine-${f}-width`]:n(U)},x),{});return _.createElement(R,E({component:f==="navbar"?"nav":"aside",ref:t,"data-hidden":l||void 0,className:K(J.root,h)},F),p,_.createElement(ie,{styles:()=>({":root":E({[`--mantine-${f}-width`]:a!=null&&a.base?n(a.base):"0rem"},Q)})}))});C.displayName="@mantine/core/HorizontalSection";var ue=Object.defineProperty,v=Object.getOwnPropertySymbols,H=Object.prototype.hasOwnProperty,G=Object.prototype.propertyIsEnumerable,I=(r,t,e)=>t in r?ue(r,t,{enumerable:!0,configurable:!0,writable:!0,value:e}):r[t]=e,ye=(r,t)=>{for(var e in t||(t={}))H.call(t,e)&&I(r,e,t[e]);if(v)for(var e of v(t))G.call(t,e)&&I(r,e,t[e]);return r},be=(r,t)=>{var e={};for(var a in r)H.call(r,a)&&t.indexOf(a)<0&&(e[a]=r[a]);if(r!=null&&v)for(var a of v(r))t.indexOf(a)<0&&G.call(r,a)&&(e[a]=r[a]);return e};const W=w.forwardRef((r,t)=>{var e=r,{children:a,grow:o=!1,sx:i}=e,s=be(e,["children","grow","sx"]);return _.createElement(R,ye({ref:t,sx:[{flex:o?1:0,boxSizing:"border-box"},...te(i)]},s),a)});W.displayName="@mantine/core/Section";const he=ae(W);var Oe=Object.defineProperty,z=Object.getOwnPropertySymbols,Pe=Object.prototype.hasOwnProperty,ge=Object.prototype.propertyIsEnumerable,B=(r,t,e)=>t in r?Oe(r,t,{enumerable:!0,configurable:!0,writable:!0,value:e}):r[t]=e,we=(r,t)=>{for(var e in t||(t={}))Pe.call(t,e)&&B(r,e,t[e]);if(z)for(var e of z(t))ge.call(t,e)&&B(r,e,t[e]);return r};const xe={fixed:!1,position:{top:0,left:0},hiddenBreakpoint:"md",hidden:!1},A=w.forwardRef((r,t)=>{const e=oe("Navbar",xe,r);return _.createElement(C,we({section:"navbar",__staticSelector:"Navbar",ref:t},e))});A.Section=he;A.displayName="@mantine/core/Navbar";export{C as H,A as N,he as S};
