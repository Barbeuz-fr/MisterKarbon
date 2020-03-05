const initToolTip = () => {
  const tooltips = document.querySelectorAll(".report-tooltip");
  tooltips.forEach((tooltip) => {
    const h5 = tooltip.querySelector('h5');
    const ul = tooltip.querySelector('ul');
    h5.title = `<ul>${ul.innerHTML}</ul>`;
    $(".report-tooltip h5").tooltip({
      html: true
    });

  });
}

export { initToolTip };
