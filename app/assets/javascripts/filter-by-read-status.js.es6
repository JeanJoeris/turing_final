var checkStatus
$(document).ready(function() {
  $("#filter-read").on('click', filterRead)
  $("#filter-unread").on('click', filterUnread)
})

function filterRead(event) {
  checkStatus = $(this).is(':checked')
  if (checkStatus === true) {
    hideObjects('.unread')
  } else {
    showObjects('.unread')
  }
}

function filterUnread(event) {
  checkStatus = $(this).is(':checked')
  if (checkStatus === true) {
    hideObjects('.read')
  } else {
    showObjects('.read')
  }
}

function hideObjects(className) {
  $(className).each(function(index) {
    $(this).hide()
  })
}

function showObjects(className) {
  $(className).each(function(index) {
    $(this).show()
  })
}
