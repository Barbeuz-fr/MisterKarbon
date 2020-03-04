const initSubmit = () => {

const formCheckLabels = document.querySelectorAll("label.form-check-label.collection_check_boxes");

formCheckLabels.forEach((formCheckLabel) => {
  formCheckLabel.addEventListener('submit', (event) => {
  event.preventDefault(); // <-- to prevent <form>'s native behaviour
  const input = event.currentTarget.querySelector('.new_report_scope_orga');
  results.innerHTML = '';
  searchMovies(input.value);
});

});

}


export { initSubmit };




