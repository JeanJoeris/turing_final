var $link, linkIds
$(document).ready(function() {
  refreshTopReads()
})

function refreshTopReads() {
  deleteOldTopReads()
  fetchTopReads()
}

function deleteOldTopReads() {
  $('.hot-read').each(function(index) {
    $(this).remove()
  })
}

function fetchTopReads() {
  $.getJSON(fetchHotReadUrl())
  .then( styleHotReads )
}

function styleHotReads(reads) {
  linkIds = Object.keys(reads)
  linkIds.map(function(key, index) {
    $link = $(`#link-${key}`)
    // special styling for top read
    if (isTopLink(linkIds, key, index)) {
      $link.prepend(topLinkHTML)
    } else {
      $link.prepend(hotLinkHTML)
    }
  })
}

function isTopLink(linkIds, key, index) {
  return linkIds[index] === key
}

function topLinkHTML() {
  return '<div class="top-read hot-read">🔥TOP READ!🔥<div>'
}

function hotLinkHTML() {
  return '<div class="hot-read">🔥Hot read🔥<div>'
}
