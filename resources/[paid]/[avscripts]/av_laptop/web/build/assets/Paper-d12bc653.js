import{n as y,m as w,r as m,a as O,R as S,e as g,a7 as h}from"./index-233adb6c.js";var x=y((r,{radius:o,shadow:a})=>({root:{outline:0,WebkitTapHighlightColor:"transparent",display:"block",textDecoration:"none",color:r.colorScheme==="dark"?r.colors.dark[0]:r.black,backgroundColor:r.colorScheme==="dark"?r.colors.dark[7]:r.white,boxSizing:"border-box",borderRadius:r.fn.radius(o),boxShadow:r.shadows[a]||a||"none","&[data-with-border]":{border:`${w(1)} solid ${r.colorScheme==="dark"?r.colors.dark[4]:r.colors.gray[3]}`}}}));const k=x;var N=Object.defineProperty,t=Object.getOwnPropertySymbols,n=Object.prototype.hasOwnProperty,l=Object.prototype.propertyIsEnumerable,s=(r,o,a)=>o in r?N(r,o,{enumerable:!0,configurable:!0,writable:!0,value:a}):r[o]=a,R=(r,o)=>{for(var a in o||(o={}))n.call(o,a)&&s(r,a,o[a]);if(t)for(var a of t(o))l.call(o,a)&&s(r,a,o[a]);return r},C=(r,o)=>{var a={};for(var e in r)n.call(r,e)&&o.indexOf(e)<0&&(a[e]=r[e]);if(r!=null&&t)for(var e of t(r))o.indexOf(e)<0&&l.call(r,e)&&(a[e]=r[e]);return a};const E={},i=m.forwardRef((r,o)=>{const a=O("Paper",E,r),{className:e,children:d,radius:c,withBorder:p,shadow:f,unstyled:u,variant:P}=a,_=C(a,["className","children","radius","withBorder","shadow","unstyled","variant"]),{classes:b,cx:v}=k({radius:c,shadow:f},{name:"Paper",unstyled:u,variant:P});return S.createElement(g,R({className:v(b.root,e),"data-with-border":p||void 0,ref:o},_),d)});i.displayName="@mantine/core/Paper";const B=h(i);export{B as P};
