import{m as g,n as Ee,o as P,R as m,E as Fa,aU as Oe,X as Ha,r as C,a as Ta,aI as Wa,Y as Ka,t as _e,aG as le,w as Ce,v as Ua,j as i,T as qa,D as Ga,z as Xa,C as Ya,aV as Za,B as Ja}from"./index-233adb6c.js";import{M as F}from"./Modal-8fbc2d38.js";import{N as Qa,T as er}from"./NumberInput-649a50ba.js";import{T as ar}from"./TextInput-ab4d4571.js";import{D as rr,u as tr,g as lr,a as se,b as sr,c as nr,d as or,S as ir}from"./Select-ab72f796.js";const $e={xs:g(16),sm:g(22),md:g(26),lg:g(30),xl:g(36)},cr={xs:g(10),sm:g(12),md:g(14),lg:g(16),xl:g(18)};var ur=Ee((e,{disabled:a,radius:t,readOnly:s},{size:u,variant:v})=>({defaultValue:{display:"flex",alignItems:"center",backgroundColor:a?e.colorScheme==="dark"?e.colors.dark[5]:e.colors.gray[3]:e.colorScheme==="dark"?e.colors.dark[7]:v==="filled"?e.white:e.colors.gray[1],color:a?e.colorScheme==="dark"?e.colors.dark[1]:e.colors.gray[7]:e.colorScheme==="dark"?e.colors.dark[0]:e.colors.gray[7],height:P({size:u,sizes:$e}),paddingLeft:`calc(${P({size:u,sizes:e.spacing})} / 1.5)`,paddingRight:a||s?P({size:u,sizes:e.spacing}):0,fontWeight:500,fontSize:P({size:u,sizes:cr}),borderRadius:P({size:t,sizes:e.radius}),cursor:a?"not-allowed":"default",userSelect:"none",maxWidth:`calc(100% - ${g(10)})`},defaultValueRemove:{color:e.colorScheme==="dark"?e.colors.dark[0]:e.colors.gray[7],marginLeft:`calc(${P({size:u,sizes:e.spacing})} / 6)`},defaultValueLabel:{display:"block",overflow:"hidden",textOverflow:"ellipsis",whiteSpace:"nowrap"}}));const dr=ur;var fr=Object.defineProperty,Z=Object.getOwnPropertySymbols,Ne=Object.prototype.hasOwnProperty,Re=Object.prototype.propertyIsEnumerable,Pe=(e,a,t)=>a in e?fr(e,a,{enumerable:!0,configurable:!0,writable:!0,value:t}):e[a]=t,pr=(e,a)=>{for(var t in a||(a={}))Ne.call(a,t)&&Pe(e,t,a[t]);if(Z)for(var t of Z(a))Re.call(a,t)&&Pe(e,t,a[t]);return e},hr=(e,a)=>{var t={};for(var s in e)Ne.call(e,s)&&a.indexOf(s)<0&&(t[s]=e[s]);if(e!=null&&Z)for(var s of Z(e))a.indexOf(s)<0&&Re.call(e,s)&&(t[s]=e[s]);return t};const mr={xs:16,sm:22,md:24,lg:26,xl:30};function ze(e){var a=e,{label:t,classNames:s,styles:u,className:v,onRemove:r,disabled:b,readOnly:n,size:p,radius:y="sm",variant:I,unstyled:U}=a,Q=hr(a,["label","classNames","styles","className","onRemove","disabled","readOnly","size","radius","variant","unstyled"]);const{classes:T,cx:M}=dr({disabled:b,readOnly:n,radius:y},{name:"MultiSelect",classNames:s,styles:u,unstyled:U,size:p,variant:I});return m.createElement("div",pr({className:M(T.defaultValue,v)},Q),m.createElement("span",{className:T.defaultValueLabel},t),!b&&!n&&m.createElement(Fa,{"aria-hidden":!0,onMouseDown:r,size:mr[p],radius:2,color:"blue",variant:"transparent",iconSize:"70%",className:T.defaultValueRemove,tabIndex:-1,unstyled:U}))}ze.displayName="@mantine/core/MultiSelect/DefaultValue";function gr({data:e,searchable:a,limit:t,searchValue:s,filter:u,value:v,disableSelectedItemFiltering:r}){if(!a&&v.length===0)return e;if(!a){const n=[];for(let p=0;p<e.length;p+=1)(r||!v.some(y=>y===e[p].value&&!e[p].disabled))&&n.push(e[p]);return n}const b=[];for(let n=0;n<e.length&&(u(s,!r&&v.some(p=>p===e[n].value&&!e[n].disabled),e[n])&&b.push(e[n]),!(b.length>=t));n+=1);return b}var vr=Object.defineProperty,yr=Object.defineProperties,br=Object.getOwnPropertyDescriptors,Ie=Object.getOwnPropertySymbols,wr=Object.prototype.hasOwnProperty,xr=Object.prototype.propertyIsEnumerable,De=(e,a,t)=>a in e?vr(e,a,{enumerable:!0,configurable:!0,writable:!0,value:t}):e[a]=t,Sr=(e,a)=>{for(var t in a||(a={}))wr.call(a,t)&&De(e,t,a[t]);if(Ie)for(var t of Ie(a))xr.call(a,t)&&De(e,t,a[t]);return e},Or=(e,a)=>yr(e,br(a)),_r=Ee((e,{invalid:a},{size:t})=>({wrapper:{position:"relative","&:has(input:disabled)":{cursor:"not-allowed",pointerEvents:"none","& .mantine-MultiSelect-input":{backgroundColor:e.colorScheme==="dark"?e.colors.dark[6]:e.colors.gray[1],color:e.colors.dark[2],opacity:.6,"&::placeholder":{color:e.colors.dark[2]}},"& .mantine-MultiSelect-defaultValue":{backgroundColor:e.colorScheme==="dark"?e.colors.dark[5]:e.colors.gray[3],color:e.colorScheme==="dark"?e.colors.dark[1]:e.colors.gray[7]}}},values:{minHeight:`calc(${P({size:t,sizes:Oe})} - ${g(2)})`,display:"flex",alignItems:"center",flexWrap:"wrap",marginLeft:`calc(-${e.spacing.xs} / 2)`,boxSizing:"border-box","&[data-clearable]":{marginRight:P({size:t,sizes:Oe})}},value:{margin:`calc(${e.spacing.xs} / 2 - ${g(2)}) calc(${e.spacing.xs} / 2)`},searchInput:Or(Sr({},e.fn.fontStyles()),{flex:1,minWidth:g(60),backgroundColor:"transparent",border:0,outline:0,fontSize:P({size:t,sizes:e.fontSizes}),padding:0,marginLeft:`calc(${e.spacing.xs} / 2)`,appearance:"none",color:"inherit",maxHeight:P({size:t,sizes:$e}),"&::placeholder":{opacity:1,color:a?e.colors.red[e.fn.primaryShade()]:e.colorScheme==="dark"?e.colors.dark[3]:e.colors.gray[5]},"&:disabled":{cursor:"not-allowed",pointerEvents:"none"}}),searchInputEmpty:{width:"100%"},searchInputInputHidden:{flex:0,width:0,minWidth:0,margin:0,overflow:"hidden"},searchInputPointer:{cursor:"pointer","&:disabled":{cursor:"not-allowed",pointerEvents:"none"}},input:{cursor:"pointer","&:disabled":{cursor:"not-allowed",pointerEvents:"none"}}}));const Cr=_r;var Pr=Object.defineProperty,Ir=Object.defineProperties,Dr=Object.getOwnPropertyDescriptors,J=Object.getOwnPropertySymbols,Me=Object.prototype.hasOwnProperty,Be=Object.prototype.propertyIsEnumerable,ke=(e,a,t)=>a in e?Pr(e,a,{enumerable:!0,configurable:!0,writable:!0,value:t}):e[a]=t,H=(e,a)=>{for(var t in a||(a={}))Me.call(a,t)&&ke(e,t,a[t]);if(J)for(var t of J(a))Be.call(a,t)&&ke(e,t,a[t]);return e},Ve=(e,a)=>Ir(e,Dr(a)),kr=(e,a)=>{var t={};for(var s in e)Me.call(e,s)&&a.indexOf(s)<0&&(t[s]=e[s]);if(e!=null&&J)for(var s of J(e))a.indexOf(s)<0&&Be.call(e,s)&&(t[s]=e[s]);return t};function Vr(e,a,t){return a?!1:t.label.toLowerCase().trim().includes(e.toLowerCase().trim())}function jr(e,a){return!!e&&!a.some(t=>t.value.toLowerCase()===e.toLowerCase())}function je(e,a){if(!Array.isArray(e))return;if(a.length===0)return[];const t=a.map(s=>typeof s=="object"?s.value:s);return e.filter(s=>t.includes(s))}const Er={size:"sm",valueComponent:ze,itemComponent:rr,transitionProps:{transition:"fade",duration:0},maxDropdownHeight:220,shadow:"sm",searchable:!1,filter:Vr,limit:1/0,clearSearchOnChange:!0,clearable:!1,clearSearchOnBlur:!1,disabled:!1,initiallyOpened:!1,creatable:!1,shouldCreate:jr,switchDirectionOnFlip:!1,zIndex:Ha("popover"),selectOnBlur:!1,positionDependencies:[],dropdownPosition:"flip"},Le=C.forwardRef((e,a)=>{const t=Ta("MultiSelect",Er,e),{className:s,style:u,required:v,label:r,description:b,size:n,error:p,classNames:y,styles:I,wrapperProps:U,value:Q,defaultValue:T,data:M,onChange:Ae,valueComponent:Fe,itemComponent:He,id:Te,transitionProps:We,maxDropdownHeight:Ke,shadow:$r,nothingFound:ne,onFocus:oe,onBlur:ie,searchable:O,placeholder:Ue,filter:qe,limit:Ge,clearSearchOnChange:Xe,clearable:ce,clearSearchOnBlur:Ye,variant:B,onSearchChange:Ze,searchValue:Je,disabled:D,initiallyOpened:Qe,radius:ue,icon:ea,rightSection:aa,rightSectionWidth:ra,creatable:de,getCreateLabel:fe,shouldCreate:ta,onCreate:pe,sx:la,dropdownComponent:sa,onDropdownClose:na,onDropdownOpen:oa,maxSelectedValues:w,withinPortal:ia,portalProps:ca,switchDirectionOnFlip:ua,zIndex:da,selectOnBlur:fa,name:pa,dropdownPosition:ha,errorProps:ma,labelProps:ga,descriptionProps:va,form:ya,positionDependencies:ba,onKeyDown:he,unstyled:W,inputContainer:wa,inputWrapperOrder:xa,readOnly:$,withAsterisk:Sa,clearButtonProps:Oa,hoverOnSearchChange:me,disableSelectedItemFiltering:_a}=t,Ca=kr(t,["className","style","required","label","description","size","error","classNames","styles","wrapperProps","value","defaultValue","data","onChange","valueComponent","itemComponent","id","transitionProps","maxDropdownHeight","shadow","nothingFound","onFocus","onBlur","searchable","placeholder","filter","limit","clearSearchOnChange","clearable","clearSearchOnBlur","variant","onSearchChange","searchValue","disabled","initiallyOpened","radius","icon","rightSection","rightSectionWidth","creatable","getCreateLabel","shouldCreate","onCreate","sx","dropdownComponent","onDropdownClose","onDropdownOpen","maxSelectedValues","withinPortal","portalProps","switchDirectionOnFlip","zIndex","selectOnBlur","name","dropdownPosition","errorProps","labelProps","descriptionProps","form","positionDependencies","onKeyDown","unstyled","inputContainer","inputWrapperOrder","readOnly","withAsterisk","clearButtonProps","hoverOnSearchChange","disableSelectedItemFiltering"]),{classes:V,cx:ge,theme:Pa}=Cr({invalid:!!p},{name:"MultiSelect",classNames:y,styles:I,unstyled:W,size:n,variant:B}),{systemStyles:Ia,rest:Da}=Wa(Ca),ee=C.useRef(),ae=C.useRef({}),L=Ka(Te),[h,f]=C.useState(Qe),[ka,j]=C.useState(-1),[ve,Va]=C.useState("column"),[_,q]=_e({value:Je,defaultValue:"",finalValue:void 0,onChange:Ze}),[ja,ye]=C.useState(!1),{scrollIntoView:G,targetRef:be,scrollableRef:Ea}=tr({duration:0,offset:5,cancelable:!1,isList:!0}),we=de&&typeof fe=="function";let re=null;const $a=M.map(l=>typeof l=="string"?{label:l,value:l}:l),te=lr({data:$a}),[c,A]=_e({value:je(Q,M),defaultValue:je(T,M),finalValue:[],onChange:Ae}),S=C.useRef(!!w&&w<c.length),xe=l=>{if(!$){const o=c.filter(x=>x!==l);A(o),w&&o.length<w&&(S.current=!1)}},Na=l=>{q(l.currentTarget.value),!D&&!S.current&&O&&f(!0)},Ra=l=>{typeof oe=="function"&&oe(l),!D&&!S.current&&O&&f(!0)},d=gr({data:te,searchable:O,searchValue:_,limit:Ge,filter:qe,value:c,disableSelectedItemFiltering:_a});we&&ta(_,te)&&(re=fe(_),d.push({label:_,value:_,creatable:!0}));const N=Math.min(ka,d.length-1),Se=(l,o,x)=>{let E=l;for(;x(E);)if(E=o(E),!d[E].disabled)return E;return l};le(()=>{j(me&&_?0:-1)},[_,me]),le(()=>{!D&&c.length>M.length&&f(!1),w&&c.length<w&&(S.current=!1),w&&c.length>=w&&(S.current=!0,f(!1))},[c]);const X=l=>{if(!$)if(Xe&&q(""),c.includes(l.value))xe(l.value);else{if(l.creatable&&typeof pe=="function"){const o=pe(l.value);typeof o<"u"&&o!==null&&A(typeof o=="string"?[...c,o]:[...c,o.value])}else A([...c,l.value]);c.length===w-1&&(S.current=!0,f(!1)),d.length===1&&f(!1)}},za=l=>{typeof ie=="function"&&ie(l),fa&&d[N]&&h&&X(d[N]),Ye&&q(""),f(!1)},Ma=l=>{if(ja||(he==null||he(l),$)||l.key!=="Backspace"&&w&&S.current)return;const o=ve==="column",x=()=>{j(R=>{var k;const K=Se(R,z=>z+1,z=>z<d.length-1);return h&&(be.current=ae.current[(k=d[K])==null?void 0:k.value],G({alignment:o?"end":"start"})),K})},E=()=>{j(R=>{var k;const K=Se(R,z=>z-1,z=>z>0);return h&&(be.current=ae.current[(k=d[K])==null?void 0:k.value],G({alignment:o?"start":"end"})),K})};switch(l.key){case"ArrowUp":{l.preventDefault(),f(!0),o?E():x();break}case"ArrowDown":{l.preventDefault(),f(!0),o?x():E();break}case"Enter":{l.preventDefault(),d[N]&&h?X(d[N]):f(!0);break}case" ":{O||(l.preventDefault(),d[N]&&h?X(d[N]):f(!0));break}case"Backspace":{c.length>0&&_.length===0&&(A(c.slice(0,-1)),f(!0),w&&(S.current=!1));break}case"Home":{if(!O){l.preventDefault(),h||f(!0);const R=d.findIndex(k=>!k.disabled);j(R),G({alignment:o?"end":"start"})}break}case"End":{if(!O){l.preventDefault(),h||f(!0);const R=d.map(k=>!!k.disabled).lastIndexOf(!1);j(R),G({alignment:o?"end":"start"})}break}case"Escape":f(!1)}},Ba=c.map(l=>{let o=te.find(x=>x.value===l&&!x.disabled);return!o&&we&&(o={value:l,label:l}),o}).filter(l=>!!l).map((l,o)=>m.createElement(Fe,Ve(H({},l),{variant:B,disabled:D,className:V.value,readOnly:$,onRemove:x=>{x.preventDefault(),x.stopPropagation(),xe(l.value)},key:l.value,size:n,styles:I,classNames:y,radius:ue,index:o}))),La=l=>c.includes(l),Aa=()=>{var l;q(""),A([]),(l=ee.current)==null||l.focus(),w&&(S.current=!1)},Y=!$&&(d.length>0?h:h&&!!ne);return le(()=>{const l=Y?oa:na;typeof l=="function"&&l()},[Y]),m.createElement(Ce.Wrapper,H(H({required:v,id:L,label:r,error:p,description:b,size:n,className:s,style:u,classNames:y,styles:I,__staticSelector:"MultiSelect",sx:la,errorProps:ma,descriptionProps:va,labelProps:ga,inputContainer:wa,inputWrapperOrder:xa,unstyled:W,withAsterisk:Sa,variant:B},Ia),U),m.createElement(se,{opened:Y,transitionProps:We,shadow:"sm",withinPortal:ia,portalProps:ca,__staticSelector:"MultiSelect",onDirectionChange:Va,switchDirectionOnFlip:ua,zIndex:da,dropdownPosition:ha,positionDependencies:[...ba,_],classNames:y,styles:I,unstyled:W,variant:B},m.createElement(se.Target,null,m.createElement("div",{className:V.wrapper,role:"combobox","aria-haspopup":"listbox","aria-owns":h&&Y?`${L}-items`:null,"aria-controls":L,"aria-expanded":h,onMouseLeave:()=>j(-1),tabIndex:-1},m.createElement("input",{type:"hidden",name:pa,value:c.join(","),form:ya,disabled:D}),m.createElement(Ce,H({__staticSelector:"MultiSelect",style:{overflow:"hidden"},component:"div",multiline:!0,size:n,variant:B,disabled:D,error:p,required:v,radius:ue,icon:ea,unstyled:W,onMouseDown:l=>{var o;l.preventDefault(),!D&&!S.current&&f(!h),(o=ee.current)==null||o.focus()},classNames:Ve(H({},y),{input:ge({[V.input]:!O},y==null?void 0:y.input)})},sr({theme:Pa,rightSection:aa,rightSectionWidth:ra,styles:I,size:n,shouldClear:ce&&c.length>0,onClear:Aa,error:p,disabled:D,clearButtonProps:Oa,readOnly:$})),m.createElement("div",{className:V.values,"data-clearable":ce||void 0},Ba,m.createElement("input",H({ref:Ua(a,ee),type:"search",id:L,className:ge(V.searchInput,{[V.searchInputPointer]:!O,[V.searchInputInputHidden]:!h&&c.length>0||!O&&c.length>0,[V.searchInputEmpty]:c.length===0}),onKeyDown:Ma,value:_,onChange:Na,onFocus:Ra,onBlur:za,readOnly:!O||S.current||$,placeholder:c.length===0?Ue:void 0,disabled:D,"data-mantine-stop-propagation":h,autoComplete:"off",onCompositionStart:()=>ye(!0),onCompositionEnd:()=>ye(!1)},Da)))))),m.createElement(se.Dropdown,{component:sa||nr,maxHeight:Ke,direction:ve,id:L,innerRef:Ea,__staticSelector:"MultiSelect",classNames:y,styles:I},m.createElement(or,{data:d,hovered:N,classNames:y,styles:I,uuid:L,__staticSelector:"MultiSelect",onItemHover:j,onItemSelect:X,itemsRefs:ae,itemComponent:He,size:n,nothingFound:ne,isItemSelected:La,creatable:de&&!!re,createLabel:re,unstyled:W,variant:B}))))});Le.displayName="@mantine/core/MultiSelect";const Lr=({data:e,callback:a})=>{var v;const[t,s]=C.useState({}),u=(r,b)=>{const n={...t,[r]:b};s(n)};return C.useEffect(()=>{if(e!=null&&e.extraData){const r={...t,extraData:e.extraData};s(r)}},[e]),i.jsxs(F.Root,{opened:!0,onClose:()=>{a()},target:".app-content",size:"350px",radius:5,children:[i.jsx(F.Overlay,{}),i.jsxs(F.Content,{children:[i.jsxs(F.Header,{children:[i.jsx(qa,{order:4,style:{width:"100%",textAlign:"center"},children:e.title}),i.jsx(F.CloseButton,{})]}),i.jsx(Ga,{}),i.jsxs(F.Body,{children:[i.jsx("span",{className:"modal-options",children:(v=e.options)==null?void 0:v.map((r,b)=>i.jsxs("span",{style:{display:"block",marginTop:"5px"},children:[r.type=="number"&&i.jsx(Qa,{icon:r.icon&&i.jsx("i",{className:r.icon}),placeholder:r.description,label:r.title,onChange:n=>{u(r.name,n)},disabled:r.disabled,sx:r.style,withAsterisk:r.asterisk,defaultValue:r.default}),r.type=="text"&&i.jsx(ar,{icon:i.jsx("i",{className:r.icon}),placeholder:r.description,defaultValue:r.default,label:r.title,onChange:n=>{u(r.name,n.target.value)},disabled:r.disabled,sx:r.style,withAsterisk:r.asterisk}),r.type=="image"&&i.jsx(Xa,{src:r.image,height:r.height,alt:r.title,sx:r.style,radius:4,withPlaceholder:!0}),r.type=="textarea"&&i.jsx(er,{defaultValue:r.description,label:r.label,disabled:r.disabled,sx:r.style,maxRows:4,autosize:!0,onChange:n=>{u(r.name,n.target.value)},withAsterisk:r.asterisk}),r.type=="info"&&i.jsx(Ya,{style:r.style,children:r.description}),r.type=="select"&&i.jsx(ir,{label:r.title,defaultValue:r.default,data:r.options,onChange:n=>{u(r.name,n)},style:r.style,withAsterisk:r.asterisk,withinPortal:!0}),r.type=="multiselect"&&i.jsx(Le,{label:r.title,data:r.options,onChange:n=>{u(r.name,n)},style:r.style,withAsterisk:r.asterisk,maxSelectedValues:r.max,searchable:r.searchable,withinPortal:!0}),r.type=="password"&&i.jsx(Za,{icon:r.icon&&i.jsx("i",{className:r.icon}),placeholder:r.description,label:r.title,withAsterisk:r.asterisk,onChange:n=>u(r.name,n.currentTarget.value)})]},b))}),e.button&&i.jsx("span",{className:"modal-button",children:i.jsx(Ja,{size:"sm",onClick:()=>{a(t)},children:e.button})})]})]})]})};export{Lr as M};
