const initActiveNavItem = () => {
  const items = document.querySelectorAll('.nav-link');
  const url = window.location.href;

  if (url.includes("#solution")) {
    items[0].classList.add("active");
  } else if (url.includes("ressources")) {
    items[1].classList.add("active");
  } else if (url.includes("articles")) {
    items[1].classList.add("active");
  } else if (url.includes("about")) {
    items[2].classList.add("active");
  } else if (url.includes("contacts/new")) {
    items[3].classList.add("active");
  }
};

export { initActiveNavItem };
