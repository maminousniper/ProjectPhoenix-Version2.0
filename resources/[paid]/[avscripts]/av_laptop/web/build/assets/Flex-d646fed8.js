import{r as O,a as P,R as u,e as w,aO as v,a6 as x}from"./index-4ee73d63.js";const j={gap:{type:"spacing",property:"gap"},rowGap:{type:"spacing",property:"rowGap"},columnGap:{type:"spacing",property:"columnGap"},align:{type:"identity",property:"alignItems"},justify:{type:"identity",property:"justifyContent"},wrap:{type:"identity",property:"flexWrap"},direction:{type:"identity",property:"flexDirection"}};var G=Object.defineProperty,S=Object.defineProperties,E=Object.getOwnPropertyDescriptors,p=Object.getOwnPropertySymbols,n=Object.prototype.hasOwnProperty,i=Object.prototype.propertyIsEnumerable,o=(r,e,t)=>e in r?G(r,e,{enumerable:!0,configurable:!0,writable:!0,value:t}):r[e]=t,b=(r,e)=>{for(var t in e||(e={}))n.call(e,t)&&o(r,t,e[t]);if(p)for(var t of p(e))i.call(e,t)&&o(r,t,e[t]);return r},F=(r,e)=>S(r,E(e)),R=(r,e)=>{var t={};for(var a in r)n.call(r,a)&&e.indexOf(a)<0&&(t[a]=r[a]);if(r!=null&&p)for(var a of p(r))e.indexOf(a)<0&&i.call(r,a)&&(t[a]=r[a]);return t};const D={},h=O.forwardRef((r,e)=>{const t=P("Flex",D,r),{gap:a,rowGap:s,columnGap:l,align:y,justify:f,wrap:c,direction:_,sx:d}=t,g=R(t,["gap","rowGap","columnGap","align","justify","wrap","direction","sx"]);return u.createElement(w,F(b({},g),{sx:[{display:"flex"},m=>v({gap:a,rowGap:s,columnGap:l,align:y,justify:f,wrap:c,direction:_},m,j),...x(d)],ref:e}))});h.displayName="@mantine/core/Flex";export{h as F};
