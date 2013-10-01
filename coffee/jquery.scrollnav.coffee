SCROLL_NAV_HTML = '''
<div class="scroll-nav"></div>
'''

SCROLL_NAV_SECTION_HTML = '''
<a class="scroll-nav-section-link">
  <div class="scroll-nav-section">
    <img class="scroll-nav-section-img"/>
    <span class="scroll-nav-tooltip"></span>
  </div>
</a>
'''

class ScrollNavigation
  constructor: (@config) ->
    @setupConfig()
    @pageSections = $(@config.pageSectionSelector)
    @buildNavHTML()
    @numberOfNavItems = @pageSections.length
    return false if @numberOfNavItems < 1
    @setNavItemHeight()
    @bindEvents()

  setupConfig: =>
    @config = jQuery.extend(
      pageSectionSelector: ".navigable-section"
      viewportOffsetTop: 0
      viewportOffsetHeight: 0
    , @config)

  buildNavSectionHtml:(sectionData) =>
    navSection = $(SCROLL_NAV_SECTION_HTML)
    navSection.attr("href", "#" + sectionData.sectionLink)
    navSection.find(".scroll-nav-section").attr("data-nav", sectionData.sectionLink)
    navSection.find(".scroll-nav-section-img").attr("src", sectionData.imgSrc)
    navSection.find(".scroll-nav-tooltip").html(sectionData.sectionTitle)
    navSection

  buildNavHTML: =>
    navContainer = $(SCROLL_NAV_HTML)
    for section in @pageSections
      navSection = @buildNavSectionHtml($(section).data())
      navContainer.append navSection
    $("body").append navContainer

  setNavItemHeight: =>
    navHeight = $(".scroll-nav").height()
    $(".scroll-nav-section").height(navHeight / @numberOfNavItems)

  bindEvents: =>
    @pageSections
    .bind("enterviewport", @selectScrollNavSection)
    .bind("leaveviewport", @deSelectScrollNavSection)
    .bullseye
      offsetTop: @config.viewportOffsetTop
      offsetHeight: @config.viewportOffsetHeight

  selectScrollNavSection: (event) =>
    activeSection = $(event.target).data("sectionLink")
    $(".scroll-nav-section[data-nav='" + activeSection + "']").addClass "selected"

  deSelectScrollNavSection: (event) =>
    inactiveSection = $(event.target).data("sectionLink")
    $(".scroll-nav-section[data-nav='" + inactiveSection + "']").removeClass "selected"

window.ScrollNavigation = ScrollNavigation
