// SELECTS ELEMENT
const select = (el, all = false) => 
{
  el = el.trim();
  if (all) 
    return document.querySelectorAll(el);
  else 
    return document.querySelector(el);
}

//SELECTS EVENT
const on = (type, el, listener, all = false) => 
{
  let selectEl = select(el, all);
  if (selectEl) 
  {
    if (all) 
      selectEl.forEach(e => e.addEventListener(type, listener));
    else 
      selectEl.addEventListener(type, listener);
  }
}

// ONSCROLL EVENT LISTENER
const onscroll = (el, listener) => 
{
  el.addEventListener('scroll', listener)
}

/**
 * Navbar links active state on scroll
 */
let navbarlinks = select('#navbar .scrollto', true)
const navbarlinksActive = () => 
{
  let position = window.scrollY + 300;
  navbarlinks.forEach(navbarlink => 
  {
    if (!navbarlink.hash) 
      return;
    
    let section = select(navbarlink.hash);
    if (!section) return;
    
    if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) 
      navbarlink.classList.add('active');
    else 
      navbarlink.classList.remove('active');
  })
}
window.addEventListener('load', navbarlinksActive);
onscroll(document, navbarlinksActive);

/**
 * Scrolls to an element with header offset
 */
const scrollto = (el) => 
{
  let header = select('#header');
  let offset = header.offsetHeight;

  let elementPos = select(el).offsetTop;
  window.scrollTo({
    top: elementPos - offset,
    behavior: 'smooth'
  })
}

// FIXED HEADER SCROLL
let selectHeader = select('#header');
if (selectHeader) 
{
  let headerOffset = selectHeader.offsetTop;
  let nextElement = selectHeader.nextElementSibling;
  
  const headerFixed = () => 
  {
    if ((headerOffset - window.scrollY) <= 0) 
    {
      selectHeader.classList.add('fixed-top');
      nextElement.classList.add('scrolled-offset');
    } 
    else 
    {
      selectHeader.classList.remove('fixed-top');
      nextElement.classList.remove('scrolled-offset');
    }
  }
  window.addEventListener('load', headerFixed);
  onscroll(document, headerFixed);
}

 
// FIXED CLUB HEADER SCROLL
let selectCHeader = select('#clubs-header');
if (selectCHeader) 
{
  let cheaderOffset = selectCHeader.offsetTop;
  let nextElement = selectCHeader.nextElementSibling;
  
  const cheaderFixed = () => 
  {
    if ((cheaderOffset - window.scrollY) <= 0) 
    {
      selectCHeader.classList.add('fixed-top');
      nextElement.classList.add('scrolled-offset');
    } 
    else 
    {
      selectCHeader.classList.remove('fixed-top');
      nextElement.classList.remove('scrolled-offset');
    }
  }
  window.addEventListener('load', cheaderFixed);
  onscroll(document, cheaderFixed);
}



//ANIMATION ON SCROLL
function aos_init() 
{
  AOS.init({
    duration: 1000,
    easing: "ease-in-out",
    once: true,
    mirror: false
  });
}
window.addEventListener('load', () => 
{
  aos_init();
});

