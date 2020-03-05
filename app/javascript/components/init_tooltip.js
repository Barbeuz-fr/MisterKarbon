const initToolTip = () => {
  const tooltips = document.querySelectorAll(".report-tooltip");
  tooltips.forEach((tooltip) => {
    const h5 = tooltip.querySelector('h5');
    const ul = tooltip.querySelector('ul');
    h5.title = `<ul>${ul.innerHTML}</ul>`;
    $(".report-tooltip h5").tooltip({
      html: true
    });
    $(function () {
      $('[data-toggle="tooltip"]').on('show.bs.tooltip', function (e) {
       //Remove title tag from inside created svg tag
       $(this).find('title').remove();
     });
    });
  });
}

export { initToolTip };
