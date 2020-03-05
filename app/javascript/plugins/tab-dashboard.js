const activeQueryDashboard = () => {
  const detailedData = document.getElementById("detailed-data");
  const progress = document.getElementById("progress");
  const progresstab = document.getElementById("progress-tab");
  const scope3tab = document.getElementById("detailed-data-tab");
  if(detailedData && detailedData.dataset.query !== "") {
    detailedData.classList.add("active");
    progress.classList.remove("active");
    detailedDatatab.classList.add("active");
    progresstab.classList.remove("active");
  }
};

export { activeQueryDashboard};
