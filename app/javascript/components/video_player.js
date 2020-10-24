import { fetchWithToken } from "components/fetch_with_token";

const player = videojs('user-video')
const video = document.getElementById("user-video");
let counter = document.getElementById("video-views");
let play;


function viewCounter() {
  video.addEventListener("play", function() {
    const url = `/videos/${video.dataset.videoId}/video_views/${video.dataset.videoViewId}`;
    if (!play) {
      fetchWithToken(url, {
        method: "PATCH",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
      })

      .then(response => {
        response.json();
      })
      .then((data) => {
        // handle JSON response from server
        play = true;
      });
    }
  }, true);
}

function initPlayer() {
  play = false;
  return player;
}

export { initPlayer, viewCounter }
