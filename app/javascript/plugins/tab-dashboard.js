const activeQueryDashboard = () => {
  const detailedData = document.getElementById("detailed-data");
  const progress = document.getElementById("progress");
  const progressTab = document.getElementById("progress-tab");
  const detailedDataTab = document.getElementById("detailed-data-tab");
  if(detailedDataTab && detailedDataTab.dataset.query !== "") {
    detailedData.classList.add("active");
    progress.classList.remove("active");
    detailedDatatab.classList.add("active");
    progresstab.classList.remove("active");
  }
};

export { activeQueryDashboard};
