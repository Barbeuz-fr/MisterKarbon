const initSubmit = () => {

const formCheckLabels = document.querySelectorAll("label.form-check-label.collection_check_boxes");

const form = document.getElementById("new_report_scope_orga");

formCheckLabels.forEach((formCheckLabel) => {
  formCheckLabel.addEventListener('click', (event) => { // <-- to prevent <form>'s native behaviour
      formCheckLabel.previousElementSibling.checked = true
      form.submit();
      console.log("test")
});

});

}


export { initSubmit };




