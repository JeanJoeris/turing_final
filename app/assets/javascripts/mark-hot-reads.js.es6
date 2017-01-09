var $link
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
  Object.keys(reads).map(function(key, index) {
    $link = $(`#link-${key}`)
    // special styling for top read
    if (index === 0) {
      $link.prepend(topLinkHTML)
    } else {
      $link.prepend(hotLinkHTML)
    }
  })
}

function topLinkHTML() {
  return '<div class="top-read hot-read">🔥TOP READ!🔥<div>'
}

function hotLinkHTML() {
  return '<div class="hot-read">🔥Hot read🔥<div>'
}
