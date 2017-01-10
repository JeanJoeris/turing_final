var $link, topReadID
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
  topReadID = getTopReadID(reads)
  Object.keys(reads).map(function(key, index) {
    $link = $(`#link-${key}`)
    if (isTopLink(topReadID, key, $link)) {
      $link.prepend(topLinkHTML)
    } else {
      $link.prepend(hotLinkHTML)
    }
  })
}

function isTopLink(topReadID, key, $link) {
  return topReadID === key && String($link.data('id')) === key
}

function getTopReadID(reads) {
  var max = 0
  var idOfMax
  Object.keys(reads).map(function(key, index) {
    if (reads[key] > max) {
      max = reads[key]
      idOfMax = key
    }
  })
  return idOfMax
}

function topLinkHTML() {
  return '<div class="top-read hot-read">🔥TOP READ!🔥<div>'
}

function hotLinkHTML() {
  return '<div class="hot-read">🔥Hot read🔥<div>'
}
