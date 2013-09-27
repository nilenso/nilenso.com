function selectScrollNavSection(event) {
  activeSection = $(event.target).data("section");
  $(".scroll-nav-section[data-nav='" + activeSection + "']").addClass("selected");
}

function deSelectScrollNavSection(event) {
  inactiveSection = $(event.target).data("section");
  $(".scroll-nav-section[data-nav='" + inactiveSection + "']").removeClass("selected");
}

function setUpScrollNav() {
  var numberOfNavItems = $("[data-section]").length;
  if (numberOfNavItems < 1) { return false; }
  var navHeight = $(".scroll-nav").height();
  $(".scroll-nav-section").height(navHeight/numberOfNavItems);
  $(".bordered-section")
    .bind('enterviewport', selectScrollNavSection)
    .bind('leaveviewport', deSelectScrollNavSection)
    .bullseye({offsetTop: 200, offsetHeight: -500});
  $(".scroll-nav-section").click(selectScrollNavSection);
}
