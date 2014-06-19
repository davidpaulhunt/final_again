# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).ready ->

    $(".sport-select").on "change", ->
      target = "#position-select-" + $(this).attr("sport_id")
      $(target).toggle()

    $(".sport-stat-select").on "change", ->
      target = "#stat-select-" + $(this).attr("sport_id")
      alert target
      $(target).toggle()

    $(".sport-stat").on "click", ->
      block = "#sport-stat-block-" + $(this).attr("sport_id")
      $(block).toggle()

    $(".change-stat").on "click", ->
      stat_id = $(this).attr("stat_id")
      input = "#player-stat-input-" + stat_id
      label = "#stat-value-" + stat_id
      current = parseInt($(label).text())
      change = parseInt($(input).val())
      action = $(this).attr("action")
      if $(input).val() == ""
        alert "Sorry, you need something to add or take away, please."
      else
        if action == "add"
          total = current + change
        else
          total = current - change
        $.ajax
          url: "/player_stats/" + stat_id
          data:
            player_stat:
              value: total
          type: "PUT"
          success: ->
            $(label).text(total)
            $(input).val("")