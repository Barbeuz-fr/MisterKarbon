const activeQueryDashboard = () => {
  const detailedData = document.getElementById("detailed-data");
  const progress = document.getElementById("progress");
  const detailedDataTab = document.getElementById("detailed-data-tab");
  const progressTab = document.getElementById("progress-tab");
  if(detailedData && detailedData.dataset.query !== "") {
    detailedData.classList.add("active");
    progress.classList.remove("active");
    detailedDataTab.classList.add("active");
    progressTab.classList.remove("active");
  }
};

export { activeQueryDashboard};
