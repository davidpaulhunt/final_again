# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  if $("#user_type").val == "Coach"
    $("#positions_").attr("disabled", "disabled")
    $("#school_").removeAttr("disabled")
  else
    $("#positions_").removeAttr("disabled")
    $("#school_").attr("disabled", "disabled")

  $(document).ready ->
    $("#user_type").change ->
      if $(this).val() != "Player"
        $("#positions-form").hide()
        $("#school-form").show()
      else
        $("#positions-form").show()
        $("#school-form").hide()
        