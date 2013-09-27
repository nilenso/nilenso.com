class ScrollNavigation
  constructor: (@config) ->
    @setupConfig()
    @numberOfNavItems = $("[data-section]").length
    return false if @numberOfNavItems < 1
    @setNavItemHeight()
    @bindEvents()

  setupConfig: =>
    @config = jQuery.extend(
      pageSectionSelector: ".navigable-section"
      viewportOffsetTop: 0
      viewportOffsetHeight: 0
    , @config)

  setNavItemHeight: =>
    navHeight = $(".scroll-nav").height()
    $(".scroll-nav-section").height(navHeight / @numberOfNavItems)

  bindEvents: =>
    $(@config.pageSectionSelector)
    .bind("enterviewport", @selectScrollNavSection)
    .bind("leaveviewport", @deSelectScrollNavSection)
    .bullseye
      offsetTop: @config.viewportOffsetTop
      offsetHeight: @config.viewportOffsetHeight

  selectScrollNavSection: (event) =>
    activeSection = $(event.target).data("section")
    $(".scroll-nav-section[data-nav='" + activeSection + "']").addClass "selected"

  deSelectScrollNavSection: (event) =>
    inactiveSection = $(event.target).data("section")
    $(".scroll-nav-section[data-nav='" + inactiveSection + "']").removeClass "selected"

window.ScrollNavigation = ScrollNavigation
