ready = ->

  try
    document.addEventListener "gr:widget:ready", ->
      $(document).on "page:load", ->
        grInitEvent = new CustomEvent("gr:widget:initialize")
        document.dispatchEvent grInitEvent
  catch
    # Обрабатывать не нужно


  $(document).on "gr:widget:ready", ->
    $(document).on('page:load', initGetReview)

  $("ul.workshops-categories li a").on "click", ->
    $(@).parent().addClass("active")
    $(@).parent().siblings().removeClass("active")

    $(".workshop").addClass("hidden")
    $(".workshop[category_id=#{$(@).parent().attr('category_id')}]").removeClass('hidden')

    false

  $("#order-button").on "click", ->

    $(".modal-overlay").show()
    $(".modal").show()

    $(".modal-overlay").on "click", ->
      $(".modal-overlay").hide()
      $(".modal").hide()

    $("#order-form").attr "workshop_id", $(@).attr("workshop_id")


  $("#order-form").on "submit", ->
    username = $("input[name=username]").val()
    phone = $("input[name=phone]").val()

    invalid_fields = []

    if username.length == 0
      invalid_fields.push {field: "username", msg: "Это поле обязательно для заполнения"}

    if phone.length == 0
      invalid_fields.push {field: "phone", msg: "Это поле обязательно для заполнения"}

    if invalid_fields.length > 0
      render_validation_errors invalid_fields
      return false

    $.post(
      '/orders'
      {
        "order[username]": username,
        "order[phone]": phone,
        "order[workshop_id]": $(@).attr("workshop_id")
        "order[session_id]": call_value
      }
      (data) =>
        $("input").removeClass "invalid"
        $("input[type=text]").val ""

        $(".modal-form form").hide()
        $(".modal-form .modal-result").html("Ваша заявка отправлена!")
        $(".modal-result").show()

        $(".modal-overlay").off "click"

        $(".modal-overlay").on "click", ->
          $(".modal").hide()
          $(".modal-overlay").hide()
          $(".modal-result").hide()
          $(".modal-form form").show()
    )

    false

window.render_validation_errors = (invalid_fields) ->

  render_validation_error(field) for field in invalid_fields

window.render_validation_error = (field) ->
  $("input[name=#{field.field}]").addClass "invalid"

initGetReview = ->
  $(document).trigger "gr:widget:initialize"

$(document).ready(ready)
$(document).on('page:load', ready)

