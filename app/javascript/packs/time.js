const timeEl = document.querySelector("#time");
const time = new Date().toLocaleTimeString('en-US', {hour: 'numeric', minute: 'numeric', hour12: true })

timeEl.innerHTML = time;