const player = videojs('user-video')
const video = document.getElementById("user-video");
let counter = document.getElementById("video-views");

function initPlayer() {
  return player
}


function eraseViews(counter) {
  if (counter.firstChild) {
    counter.removeChild(counter.firstChild)
  }
}


let amount = 0


function viewCounter() {
  video.addEventListener("play", function() {
    amount += 1
    eraseViews(counter);
    counter.innerHTML = amount;
}, true);
}

export { initPlayer, viewCounter }
