# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "click", '.cancel-update-link', (e) ->
  e.preventDefault()
  replied = $(this).data('reply')
  # console.log replied
  $update = $(this).closest('.update')
  # console.log $update
  $form = $(this).closest('form')
  $restore_link = $update.find('a.delete-update-link')[0]
  if replied is true
    $reply_link = $update.find('a.reply-update-link')[0]
    # console.log $reply_link
    $reply_link.href = "#{$restore_link.href}/reply"
  $edit_link = $update.find('a.edit-update-link')[0]
  # console.log $edit_link
  $edit_link.href = "#{$restore_link.href}/edit"
  $form.remove()


# Handle 401 error on ajax call.
$(document).ajaxError (_, xhr)->
  window.location = '/users/sign_in' if xhr.status == 401

