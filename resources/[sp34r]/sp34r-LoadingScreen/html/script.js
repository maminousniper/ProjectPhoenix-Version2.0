var audio = document.getElementById("audio");
audio.volume = 0.30;

function audiotoggle() {
    var audio = document.getElementById("audio");
    if (audio.paused) {
        localStorage.setItem("LoadingMusic", "NotMuteLOL");
        document.getElementById("MusicImg").src = './assets/MusicOn.svg';
        audio.play();
    } else {
        localStorage.setItem("LoadingMusic", "Mute");
        document.getElementById("MusicImg").src = './assets/MusicOff.svg';
        audio.pause();
    }
}
if (localStorage.getItem("LoadingMusic") == "Mute") {
    document.getElementById("MusicImg").src = './assets/MusicOff.svg';
    audio.pause();
}

let count = 0;
let thisCount = 0;

const handlers = {
    startInitFunctionOrder(data) {
        count = data.count;
    },
    initFunctionInvoking(data) {
        document.querySelector(".Progress").style.width = (data.idx / count) * 100 + "%";
    },
    startDataFileEntries(data) {
        count = data.count;
    },
    performMapLoadFunction(data) {
        ++thisCount;
        document.querySelector(".Progress").style.width = (thisCount / count) * 100 + "%";
    },
};

window.addEventListener("message", function (e) {
    (handlers[e.data.eventName] || function () {})(e.data);
});

window.addEventListener('DOMContentLoaded', () => {
    document.querySelector('#WelcomeTxt').innerText = window.nuiHandoverData.name+', Welcome To Royal RP';
});