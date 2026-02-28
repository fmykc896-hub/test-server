// アコーディオン
const acc = document.querySelectorAll('.accordion-btn');
acc.forEach(btn => {
  btn.addEventListener('click', () => {
    btn.classList.toggle('active');
    const content = btn.nextElementSibling;
    if(content.style.display === "block") content.style.display = "none";
    else content.style.display = "block";
  });
});

// スクロールでフェードイン
const faders = document.querySelectorAll('.fade');

const appearOptions = {
  threshold: 0.1,
  rootMargin: "0px 0px -50px 0px"
};

const appearOnScroll = new IntersectionObserver((entries, appearOnScroll) => {
  entries.forEach(entry => {
    if(!entry.isIntersecting) return;
    entry.target.classList.add('show');
    appearOnScroll.unobserve(entry.target);
  });
}, appearOptions);

faders.forEach(fader => {
  appearOnScroll.observe(fader);
});