$ ->

  $('.redactor').redactor
    lang: 'ru'
    plugins: ['fullscreen']
    buttons: ['bold', 'italic', 'unorderedlist', 'orderedlist', 'link']

  $("input.datepicker").datepicker
    language: "ru"
    autoclose: true

  $("#fileupload").fileupload
    url: "/admin/reviews"
    done: (e, data) ->
      $("#reviews").prepend data.result