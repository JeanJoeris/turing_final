var $searchLinks, searchText, linkTitle, linkUrl, validResult
$(document).ready(function() {
  attachSearchEventListener()
})

function attachSearchEventListener() {
  $searchLinks = $('#search-links')
  $searchLinks.keyup(filterResults)
}

function filterResults(event) {
  searchText = getSearchText().toLowerCase()
  $('.link').each(function(index) {
    linkTitle = fetchLinkTitle($(this))
    linkUrl = fetchLinkUrl($(this))
    validResult = (linkTitle.includes(searchText) || linkUrl.includes(searchText))
    if (validResult === false) {
      $(this).hide()
    } else {
      $(this).show()
    }
  })
}

function getSearchText() {
  return $searchLinks.val()
}

function fetchLinkTitle($link) {
  return $link.children('.link-title').text().toLowerCase()
}

function fetchLinkUrl($link) {
  return $link.children('.link-url').text().toLowerCase()
}
