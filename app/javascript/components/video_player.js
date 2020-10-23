const player = videojs('user-video')

function initPlayer() {
  return player
}


let counter = document.getElementById("video-views");
let video = document.getElementById("user-video");


let amount = 0
function viewCounter() {
  video.addEventListener("play", function() {
    amount += 1
    counter.insertAdjacentHTML("beforeend", amount);
}, true);
}

export { initPlayer, viewCounter }
