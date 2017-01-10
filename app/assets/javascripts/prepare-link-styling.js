$(document).ready(function(){
  stylizeLinks()
})

function stylizeLinks () {
  $('.link').each(function() {
    var readStatus = $(this).find('.link-read-status').text()
    if (readStatus === 'true') {
      $(this).removeClass('unread')
      $(this).addClass('read')
      changeButtonToRead($(this))
    } else {
      $(this).removeClass('read')
      $(this).addClass('unread')
    }
  })
}
