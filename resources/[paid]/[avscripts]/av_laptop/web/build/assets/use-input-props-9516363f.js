import{a as W,Y as R,aD as V}from"./index-4ee73d63.js";var Y=Object.defineProperty,k=Object.defineProperties,B=Object.getOwnPropertyDescriptors,p=Object.getOwnPropertySymbols,y=Object.prototype.hasOwnProperty,v=Object.prototype.propertyIsEnumerable,u=(r,e,t)=>e in r?Y(r,e,{enumerable:!0,configurable:!0,writable:!0,value:t}):r[e]=t,a=(r,e)=>{for(var t in e||(e={}))y.call(e,t)&&u(r,t,e[t]);if(p)for(var t of p(e))v.call(e,t)&&u(r,t,e[t]);return r},F=(r,e)=>k(r,B(e)),G=(r,e)=>{var t={};for(var s in r)y.call(r,s)&&e.indexOf(s)<0&&(t[s]=r[s]);if(r!=null&&p)for(var s of p(r))e.indexOf(s)<0&&v.call(r,s)&&(t[s]=r[s]);return t};function J(r,e,t){const s=W(r,e,t),{label:O,description:m,error:l,required:P,classNames:o,styles:i,className:w,unstyled:n,__staticSelector:_,sx:b,errorProps:S,labelProps:g,descriptionProps:h,wrapperProps:j,id:x,size:c,style:N,inputContainer:D,inputWrapperOrder:I,withAsterisk:C,variant:d}=s,q=G(s,["label","description","error","required","classNames","styles","className","unstyled","__staticSelector","sx","errorProps","labelProps","descriptionProps","wrapperProps","id","size","style","inputContainer","inputWrapperOrder","withAsterisk","variant"]),f=R(x),{systemStyles:z,rest:A}=V(q),E=a({label:O,description:m,error:l,required:P,classNames:o,className:w,__staticSelector:_,sx:b,errorProps:S,labelProps:g,descriptionProps:h,unstyled:n,styles:i,id:f,size:c,style:N,inputContainer:D,inputWrapperOrder:I,withAsterisk:C,variant:d},j);return F(a({},A),{classNames:o,styles:i,unstyled:n,wrapperProps:a(a({},E),z),inputProps:{required:P,classNames:o,styles:i,unstyled:n,id:f,size:c,__staticSelector:_,error:l,variant:d}})}export{J as u};
