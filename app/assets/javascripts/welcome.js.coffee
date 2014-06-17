$ ->
  $("#new-sport").on "click", ->
    $("#new-sport-modal").removeClass "hidden-modal"

  $("#add-sport-button").on "click", ->
    $("#new-sport-modal").addClass "hidden-modal"

  $ ->
    $(document).on "focus", "div.form-group-options div.input-group-option:last-child input", ->
      sInputGroupHtml = $(this).parent().html()
      sInputGroupClasses = $(this).parent().attr("class")
      $(this).parent().parent().append "<div class=\"" + sInputGroupClasses + "\">" + sInputGroupHtml + "</div>"
      return

    $(document).on "click", "div.form-group-options .input-group-addon-remove", ->
      $(this).parent().remove()
      return

    return


  # 
  #      Selects 
  #  
  $ ->
    updateValues = ->
      values = []
      $(".form-group-multiple-selects .input-group-multiple-select select").each ->
        value = $(this).val()
        values.push value  if value isnt 0 and value isnt ""
        return

      $(".form-group-multiple-selects .input-group-multiple-select select").find("option").each ->
        optionValue = $(this).val()
        selectValue = $(this).parent().val()
        if in_array(optionValue, values) isnt -1 and selectValue isnt optionValue
          $(this).attr "disabled", "disabled"
        else
          $(this).removeAttr "disabled"
        return

      return
    in_array = (needle, haystack) ->
      found = 0
      i = 0
      length = haystack.length

      while i < length
        return i  if haystack[i] is needle
        found++
        i++
      -1
    values = []
    $(document).on "change", ".form-group-multiple-selects .input-group-multiple-select:last-child select", ->
      selectsLength = $(".form-group-multiple-selects .input-group-multiple-select select").length
      optionsLength = ($(this).find("option").length) - 1
      if selectsLength < optionsLength
        sInputGroupHtml = $(this).parent().html()
        sInputGroupClasses = $(this).parent().attr("class")
        $(this).parent().parent().append "<div class=\"" + sInputGroupClasses + "\">" + sInputGroupHtml + "</div>"
      updateValues()
      return

    $(document).on "change", ".form-group-multiple-selects .input-group-multiple-select:not(:last-child) select", ->
      updateValues()
      return

    $(document).on "click", ".input-group-addon-remove", ->
      $(this).parent().remove()
      updateValues()
      return

    return
