import{m as s,n as P,o as I,r as w,a as S,R as x,e as $,c as j}from"./index-30f42a89.js";var z=Object.defineProperty,C=Object.defineProperties,E=Object.getOwnPropertyDescriptors,c=Object.getOwnPropertySymbols,N=Object.prototype.hasOwnProperty,k=Object.prototype.propertyIsEnumerable,d=(e,r,a)=>r in e?z(e,r,{enumerable:!0,configurable:!0,writable:!0,value:a}):e[r]=a,p=(e,r)=>{for(var a in r||(r={}))N.call(r,a)&&d(e,a,r[a]);if(c)for(var a of c(r))k.call(r,a)&&d(e,a,r[a]);return e},M=(e,r)=>C(e,E(r));const R={xs:s(16),sm:s(20),md:s(26),lg:s(32),xl:s(40)},T=["filled","light","gradient","outline","default"];function V({theme:e,variant:r,color:a,gradient:t}){if(!T.includes(r))return null;const o=e.fn.variant({variant:r,color:a||e.primaryColor,gradient:t,primaryFallback:!1});return{backgroundColor:o.background,color:o.color,backgroundImage:r==="gradient"?o.background:void 0,border:`${s(r==="gradient"?0:1)} solid ${o.border}`}}var D=P((e,{color:r,radius:a,gradient:t},{variant:o,size:i})=>{const n=I({size:i,sizes:R});return{root:p(M(p({},e.fn.fontStyles()),{display:"inline-flex",alignItems:"center",justifyContent:"center",boxSizing:"border-box",width:n,height:n,minWidth:n,minHeight:n,borderRadius:e.fn.radius(a)}),V({theme:e,variant:o,gradient:t,color:r}))}});const A=D;var H=Object.defineProperty,l=Object.getOwnPropertySymbols,m=Object.prototype.hasOwnProperty,u=Object.prototype.propertyIsEnumerable,f=(e,r,a)=>r in e?H(e,r,{enumerable:!0,configurable:!0,writable:!0,value:a}):e[r]=a,L=(e,r)=>{for(var a in r||(r={}))m.call(r,a)&&f(e,a,r[a]);if(l)for(var a of l(r))u.call(r,a)&&f(e,a,r[a]);return e},B=(e,r)=>{var a={};for(var t in e)m.call(e,t)&&r.indexOf(t)<0&&(a[t]=e[t]);if(e!=null&&l)for(var t of l(e))r.indexOf(t)<0&&u.call(e,t)&&(a[t]=e[t]);return a};const F={size:"md",variant:"filled"},W=w.forwardRef((e,r)=>{const a=S("ThemeIcon",F,e),{className:t,size:o,radius:i,variant:n,color:_,children:v,gradient:g,unstyled:y}=a,h=B(a,["className","size","radius","variant","color","children","gradient","unstyled"]),{classes:O,cx:b}=A({variant:n,radius:i,color:_,gradient:g},{name:"ThemeIcon",unstyled:y,variant:n,size:o});return x.createElement($,L({className:b(O.root,t),ref:r},h),v)});W.displayName="@mantine/core/ThemeIcon";var G=j("clipboard-list","IconClipboardList",[["path",{d:"M9 5h-2a2 2 0 0 0 -2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-12a2 2 0 0 0 -2 -2h-2",key:"svg-0"}],["path",{d:"M9 3m0 2a2 2 0 0 1 2 -2h2a2 2 0 0 1 2 2v0a2 2 0 0 1 -2 2h-2a2 2 0 0 1 -2 -2z",key:"svg-1"}],["path",{d:"M9 12l.01 0",key:"svg-2"}],["path",{d:"M13 12l2 0",key:"svg-3"}],["path",{d:"M9 16l.01 0",key:"svg-4"}],["path",{d:"M13 16l2 0",key:"svg-5"}]]);export{G as I,W as T};
