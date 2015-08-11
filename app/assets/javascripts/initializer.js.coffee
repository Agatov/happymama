$ ->

  $("ul.workshops-categories li a").on "click", ->
    $(@).parent().addClass("active")
    $(@).parent().siblings().removeClass("active")

    $(".workshop").addClass("hidden")
    $(".workshop[category_id=#{$(@).parent().attr('category_id')}]").removeClass('hidden')

    false