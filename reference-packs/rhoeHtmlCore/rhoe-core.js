(() => {
  const frames = Array.from(document.querySelectorAll(".rhoe-viewer .rhoe-frame"));
  if (!frames.length) return;

  const root = document.documentElement;
  const body = document.body;
  const status = document.querySelector("[data-rhoe-viewer-status]");
  let index = 0;

  const updateStatus = () => {
    if (status) status.textContent = `Frame ${index + 1} of ${frames.length}`;
    root.dataset.rhoeViewerIndex = String(index);
    root.dataset.rhoeViewerFrameCount = String(frames.length);
  };

  const activate = next => {
    index = Math.max(0, Math.min(next, frames.length - 1));
    frames.forEach((frame, i) => {
      frame.classList.toggle("is-active", i === index);
      frame.hidden = i !== index;
      frame.dataset.rhoeActive = i === index ? "true" : "false";
      frame.setAttribute("aria-hidden", i === index ? "false" : "true");
      frame.tabIndex = i === index ? 0 : -1;
    });
    updateStatus();
  };

  document.addEventListener("keydown", event => {
    if (event.key === "ArrowRight") activate(index + 1);
    if (event.key === "ArrowLeft") activate(index - 1);
    if (event.key === "Home") activate(0);
    if (event.key === "End") activate(frames.length - 1);
    if (event.key.toLowerCase() === "p") body.classList.toggle("is-presenter-mode");
  });

  activate(0);
})();
