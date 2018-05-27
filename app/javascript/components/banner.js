import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Ecrivez en toute liberté", "sur des sujets qui vous inspirent"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
