const activeQueryDashboard = () => {
  const scope3 = document.getElementById("scope3");
  const scope1 = document.getElementById("scope1");
  const scope1tab = document.getElementById("scope1-tab");
  const scope3tab = document.getElementById("scope3-tab");
  if(scope3 && scope3.dataset.query !== "") {
    scope3.classList.add("active");
    scope1.classList.remove("active");
    scope3tab.classList.add("active");
    scope1tab.classList.remove("active");
  }
};

export { activeQueryDashboard};
