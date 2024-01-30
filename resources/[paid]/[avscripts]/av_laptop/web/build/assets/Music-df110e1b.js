import{r as u,a as B,R,c as I,b,u as y,s as O,d as S,j as e,e as d,T as h,A as k,f as w,g as C,_ as J,L as X,h as _,i as P,D as W,k as Z,H as A,I as K,l as Y}from"./index-233adb6c.js";import{F as v,b as ee,S as se,c as te,d as re,f as ne,a as ie,e as ae}from"./index-d5e75457.js";import{P as oe}from"./Progress-6471b880.js";import{T as N}from"./Tooltip-22b501b5.js";import{T as le}from"./Table-9128062c.js";import{A as ce}from"./AppShell-ae46d005.js";import{H as de,S as pe,N as he}from"./Navbar-d15a2fa8.js";import{V as xe}from"./VerticalSection-74fb7140.js";var ge=Object.defineProperty,L=Object.getOwnPropertySymbols,me=Object.prototype.hasOwnProperty,ue=Object.prototype.propertyIsEnumerable,E=(r,t,s)=>t in r?ge(r,t,{enumerable:!0,configurable:!0,writable:!0,value:s}):r[t]=s,ye=(r,t)=>{for(var s in t||(t={}))me.call(t,s)&&E(r,s,t[s]);if(L)for(var s of L(t))ue.call(t,s)&&E(r,s,t[s]);return r};const fe={fixed:!1,position:{top:0,right:0},hiddenBreakpoint:"md",hidden:!1},z=u.forwardRef((r,t)=>{const s=B("Aside",fe,r);return R.createElement(de,ye({section:"aside",__staticSelector:"Aside",ref:t},s))});z.Section=pe;z.displayName="@mantine/core/Aside";var je=Object.defineProperty,ve=Object.defineProperties,we=Object.getOwnPropertyDescriptors,F=Object.getOwnPropertySymbols,be=Object.prototype.hasOwnProperty,_e=Object.prototype.propertyIsEnumerable,H=(r,t,s)=>t in r?je(r,t,{enumerable:!0,configurable:!0,writable:!0,value:s}):r[t]=s,Pe=(r,t)=>{for(var s in t||(t={}))be.call(t,s)&&H(r,s,t[s]);if(F)for(var s of F(t))_e.call(t,s)&&H(r,s,t[s]);return r},Se=(r,t)=>ve(r,we(t));const ke={fixed:!1,position:{bottom:0,left:0,right:0}},Q=u.forwardRef((r,t)=>{const s=B("Footer",ke,r);return R.createElement(xe,Se(Pe({section:"footer",__staticSelector:"Footer"},s),{ref:t}))});Q.displayName="@mantine/core/Footer";var Ce=I("device-speaker","IconDeviceSpeaker",[["path",{d:"M5 3m0 2a2 2 0 0 1 2 -2h10a2 2 0 0 1 2 2v14a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2z",key:"svg-0"}],["path",{d:"M12 14m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0",key:"svg-1"}],["path",{d:"M12 7l0 .01",key:"svg-2"}]]),Ne=I("player-play","IconPlayerPlay",[["path",{d:"M7 4v16l13 -8z",key:"svg-0"}]]),Ie=I("playlist-add","IconPlaylistAdd",[["path",{d:"M19 8h-14",key:"svg-0"}],["path",{d:"M5 12h9",key:"svg-1"}],["path",{d:"M11 16h-6",key:"svg-2"}],["path",{d:"M15 16h6",key:"svg-3"}],["path",{d:"M18 13v6",key:"svg-4"}]]),q=I("playlist","IconPlaylist",[["path",{d:"M14 17m-3 0a3 3 0 1 0 6 0a3 3 0 1 0 -6 0",key:"svg-0"}],["path",{d:"M17 17v-13h4",key:"svg-1"}],["path",{d:"M13 5h-10",key:"svg-2"}],["path",{d:"M3 9l10 0",key:"svg-3"}],["path",{d:"M9 13h-6",key:"svg-4"}]]);const V=r=>{const[t,s]=r.split(":");return Number(t)*60+Number(s)},Oe=({currentTime:r,setVolume:t,volume:s,showPlaylist:o,setShowPlaylist:l})=>{const i=b(),{lang:p}=y(O),{totalTime:m,zone:n}=y(S),a=V(r)/V(m)*100,x=()=>{w("av_music","connectZone",{connect:!n.connected}),n.connected&&l(!1)},j=async()=>{if(!n.connected)return;l(!o);const T=await w("av_music","getQueue",{name:n.name});i(C(T))};return e.jsxs(d,{style:{display:"flex",width:"100%",justifyContent:"center"},children:[e.jsxs(d,{className:"progress-container",children:[e.jsx(d,{sx:{minWidth:45},children:e.jsx(h,{order:6,children:r})}),e.jsx(d,{sx:{width:"100%"},children:e.jsx(oe,{value:a,size:"sm",radius:"xl",color:"rgba(200,200,200,1)"})}),e.jsx(d,{sx:{minWidth:45,marginLeft:"15px"},children:e.jsx(h,{order:6,children:m})})]}),e.jsx(d,{className:"volume-container",children:e.jsxs(d,{className:"main-volume-container",children:[e.jsxs(d,{sx:{display:"inline-flex"},children:[e.jsx(N,{label:n.connected?`${p.music.disconnect}`:`${p.music.connect}`,color:"dark.6",children:e.jsx(k,{color:n.connected?"green.1":"gray.1",onClick:x,children:e.jsx(Ce,{size:18})})}),(n==null?void 0:n.connected)&&e.jsx(N,{label:n!=null&&n.connected?`${p.music.show_queue}`:`${p.music.connect_first}`,color:"dark.6",children:e.jsx(k,{color:o?"green.1":"gray.1",onClick:j,children:e.jsx(q,{size:18})})})]}),e.jsxs(d,{sx:{minWidth:"100%",display:"inline-flex",marginRight:"20px",marginLeft:"5px"},children:[e.jsx(d,{sx:{width:"20px"},children:e.jsx(v,{icon:ee,onClick:()=>{s-5>=0&&t(s-5)}})}),e.jsx(se,{color:"gray.6",size:"xs",onChange:t,value:s,sx:{width:"50%",justifyContent:"center"}}),e.jsx(d,{sx:{display:"inline-flex",marginLeft:"5px",marginRight:"20%"},children:e.jsx(v,{icon:te,style:{marginTop:"5px"},onClick:()=>{s+5<=100&&t(s+5)}})})]})]})})]})};const $=r=>`https://img.youtube.com/vi/${r.match(/([a-z0-9_-]{11})/gim)[0]}/0.jpg`,Te=async r=>{const t=r.match(/([a-z0-9_-]{11})/gim)[0],o=await(await fetch(`https://www.youtube.com/watch?v=${t}`)).text(),l=JSON.parse(o.split("ytInitialPlayerResponse = ")[1].split(";var meta = document.createElement('meta')")[0]),i=l.videoDetails.author,p=l.videoDetails.title,m=l.videoDetails.lengthSeconds,n=`https://img.youtube.com/vi/${t}/0.jpg`;return await w("av_music","addQueue",{author:i,title:p,duration:m,url:r,thumbnail:n,icon:"fab fa-youtube icon"})},Me=u.lazy(()=>J(()=>import("./Player-501592d4.js"),["./Player-501592d4.js","./index-233adb6c.js","./index-ec2a5f13.css","./youtube-9ee2f30a.js"],import.meta.url)),Ae=({showPlaylist:r,setShowPlaylist:t})=>{const s=b(),{isPlaying:o,currentSong:l,cover:i,artist:p,song:m,currentRecordLabel:n,currentIndex:c}=y(S),[a,x]=u.useState("0:00"),[j,T]=u.useState(25),D=f=>{l&&s(_({isPlaying:f}))},G=()=>{if(!l)return;let f=c+1,g=n.songs[f];if(!g){s(_({isPlaying:!1})),s(P({currentSong:null,currentIndex:null,artist:"AV",song:"AV Scripts"}));return}if(f<=n.songs.length){const M=$(g.url);s(P({currentSong:g.url,currentIndex:f,artist:g.artist,song:g.title,cover:M})),s(_({isPlaying:!0}))}},U=()=>{if(!l)return;let f=c-1,g=n.songs[f];if(!g){s(_({isPlaying:!1})),s(P({currentSong:null,currentIndex:null,artist:"",song:"",cover:""}));return}const M=$(g.url);s(P({currentSong:g.url,currentIndex:f,artist:g.artist,song:g.title,cover:M})),s(_({isPlaying:!0}))};return e.jsx(e.Fragment,{children:e.jsxs(u.Suspense,{fallback:e.jsx("div",{style:{position:"relative",width:"100%",height:"100%"},children:e.jsx(X,{visible:!0,overlayBlur:2,overlayColor:"rgba(20, 21, 23, 1)"})}),children:[e.jsxs("div",{className:"cover",children:[i&&e.jsx("img",{src:i,className:"cover-img"}),e.jsxs("span",{className:"cover-info",children:[e.jsx(h,{order:4,color:"gray.2",weight:500,style:{marginTop:"2px"},children:p}),e.jsx(h,{order:5,weight:500,style:{marginTop:"-4px"},children:m})]})]}),e.jsxs("div",{className:"music-controls",children:[e.jsx(v,{icon:re,fontSize:25,style:{marginTop:"6px"},onClick:U}),o?e.jsx(v,{icon:ne,onClick:()=>{D(!1)},fontSize:35,style:{marginLeft:"25px",marginRight:"25px"}}):e.jsx(v,{icon:ie,onClick:()=>{D(!0)},fontSize:35,style:{marginLeft:"25px",marginRight:"25px"}}),e.jsx(v,{icon:ae,fontSize:25,style:{marginTop:"6px"},onClick:G})]}),e.jsx(Oe,{currentTime:a,setVolume:T,volume:j,showPlaylist:r,setShowPlaylist:t}),e.jsx(Me,{setCurrentTime:x,volume:j})]})})},$e={display:"inline-block",marginBottom:"-2px"},ze=()=>{const r=b(),{labels:t,currentRecordLabel:s}=y(S),{lang:o}=y(O),l=i=>{r(Z(i))};return e.jsxs("div",{className:"playlist-container",children:[e.jsxs("span",{className:"playlist-header",children:[e.jsx(q,{size:16,style:$e,color:"rgba(150,150,150,1)"}),e.jsx(h,{order:4,style:{display:"inline-block",marginLeft:"5px"},color:"dark.0",weight:700,children:o.music.playlists}),e.jsx(W,{size:"md",sx:{marginTop:"10px"}})]}),e.jsx("span",{className:"playlist-list",children:Object.values(t).map((i,p)=>e.jsx("span",{style:{marginTop:"20px",paddingLeft:"2px",color:i.job==(s==null?void 0:s.job)?"rgba(255,255,255,1)":"white",display:"block",overflow:"hidden",whiteSpace:"nowrap",textOverflow:"ellipsis",borderStyle:i.job==(s==null?void 0:s.job)?"none none none solid":"none",borderColor:i.job==(s==null?void 0:s.job)?"rgba(30, 215, 96,1)":"none"},onClick:()=>{l(i)},children:e.jsx(h,{order:5,style:{display:"inline-block",marginLeft:"5px"},color:"gray.1",weight:500,children:i.label})},p))})]})},De=()=>{var c;const r=b(),{lang:t}=y(O),{currentRecordLabel:s,isPlaying:o,currentSong:l,zone:i}=y(S),p=(a,x)=>{if(i.connected)return;const j=$(a.url);r(P({currentSong:a.url,currentIndex:x,artist:a.artist,song:a.title,cover:j}))},m=(c=s==null?void 0:s.songs)==null?void 0:c.map((a,x)=>e.jsxs("tr",{onClick:()=>{p(a,x)},children:[e.jsx("td",{children:l==a.url&&o?e.jsx("img",{src:"equaliser.gif",width:15}):x+1}),e.jsx("td",{style:{paddingLeft:"0px"},children:a.artist}),e.jsx("td",{children:a.title}),e.jsx("td",{children:a.date}),i.connected&&e.jsx("td",{children:e.jsx(Ie,{onClick:()=>{n(a.url)}})})]},x)),n=async a=>{const x=await Te(a);r(C(x))};return e.jsxs(d,{className:"music-app",children:[s!=null&&s.logo?e.jsx(d,{style:{display:"flex",background:`linear-gradient(to bottom, ${s==null?void 0:s.color} 0%, rgba(24,24,24,0.1) 95%, rgba(24,24,24,0.1) 250%)`,textShadow:"2px 2px 2px rgba(0, 0, 0, 0.45)",width:"100%",height:"20%"},children:e.jsxs(d,{className:"record-header",children:[e.jsx("img",{src:s.logo,className:"record-logo"}),e.jsxs("span",{className:"cover-info",children:[e.jsx(h,{order:1,color:"white",weight:500,sx:{display:"flex",marginLeft:"15px"},children:s.label}),e.jsx(h,{order:2,weight:400,color:"gray.3",sx:{display:"flex",marginLeft:"15px"},children:s.description})]})]})}):e.jsx(e.Fragment,{}),(s==null?void 0:s.songs)&&e.jsx(d,{className:"songs-container",children:e.jsxs(le,{highlightOnHover:!0,horizontalSpacing:"xl",children:[e.jsx("thead",{children:e.jsxs("tr",{children:[e.jsx("th",{children:"#"}),e.jsx("th",{style:{paddingLeft:"0px"},children:t.music.artist}),e.jsx("th",{children:t.music.song_name}),e.jsx("th",{style:{padding:"0px"},children:t.music.date}),i.connected&&e.jsx("th",{style:{padding:"0px"},children:t.music.add})]})}),e.jsx("tbody",{children:m})]})})]})},Le=()=>{const r=b(),{playlist:t,zone:s}=y(S),{lang:o}=y(O),[l,i]=u.useState(999),p=async(n,c)=>{const a=await w("av_music","playSong",{song:n,index:c});r(C(a))},m=async(n,c)=>{const a=await w("av_music","removeSong",{song:n,index:c});r(C(a))};return e.jsxs("div",{style:{maxHeight:"80%",marginTop:"50px"},children:[e.jsx(h,{order:4,style:{textAlign:"center"},children:e.jsx("a",{style:{marginLeft:"5px"},children:s.label})}),e.jsx(W,{size:"sm",sx:{marginLeft:"10px",marginTop:"5px",width:"90%",marginRight:"auto"}}),e.jsx("div",{className:"musiclist-container",children:t.map((n,c)=>e.jsxs(A,{width:"25vw",shadow:"md",position:"left",withArrow:!0,children:[e.jsx(A.Target,{children:e.jsxs("div",{className:"song-musiclist",style:{backgroundColor:l==c?"rgba(10,10,10,0.25)":"transparent"},onMouseEnter:()=>{i(c)},onMouseLeave:()=>{i(999)},children:[e.jsx(h,{order:6,style:{marginLeft:"5px",width:"25px",opacity:"0.55"},children:`${c+1}`}),e.jsx("img",{src:n==null?void 0:n.thumbnailUrl,height:30}),e.jsx(h,{order:6,style:{width:"70%",overflow:"hidden",whiteSpace:"nowrap",textOverflow:"ellipsis",marginLeft:"5px",marginTop:"3px"},children:n.title})]})}),e.jsxs(A.Dropdown,{style:{maxWidth:"300px",display:"inline-flex"},children:[e.jsx("span",{style:{background:`url(${n==null?void 0:n.thumbnailUrl}) 0% 0%`,backgroundSize:"cover",width:"100%",height:"100px"},children:e.jsxs("span",{style:{display:"flex",width:"100%",height:"100%",alignItems:"center",justifyContent:"center"},children:[e.jsx(N,{label:o.music.play,color:"dark.7",children:e.jsx(k,{style:{marginRight:"10px"},variant:"subtle",color:"blue",onClick:()=>{p(n,c)},children:e.jsx(Ne,{})})}),e.jsx(N,{label:o.music.remove,color:"dark.7",children:e.jsx(k,{variant:"subtle",color:"red",children:e.jsx(K,{onClick:()=>{m(n,c)}})})})]})}),e.jsx("span",{style:{display:"flex",height:"100px",width:"250px",alignItems:"center",marginLeft:"10px",overflow:"hidden",justifyContent:"center"},children:e.jsx(h,{order:6,children:n.title})})]})]},c))})]})};const qe=()=>{const r=b(),[t,s]=u.useState(!1);return u.useEffect(()=>{(async()=>{const l=await w("av_music","getData");r(Y(l))})()},[]),e.jsx(e.Fragment,{children:e.jsx(ce,{padding:"0px",navbar:e.jsx(he,{width:{base:200},height:"100%",p:"0",style:{paddingTop:"30px"},children:e.jsx(ze,{})}),footer:e.jsx(Q,{height:75,children:e.jsx(Ae,{showPlaylist:t,setShowPlaylist:s})}),aside:e.jsx(z,{width:{base:t?250:1},className:"musiclist-aside",children:e.jsx(Le,{})}),styles:o=>({main:{backgroundColor:o.colorScheme==="dark"?o.colors.dark[8]:o.colors.gray[0]}}),children:e.jsx(De,{})})})};export{qe as default};
