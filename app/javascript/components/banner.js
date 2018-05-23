import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Libérez votre inspiration", "sur des thèmes qui vous inspirent"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
