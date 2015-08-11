$ ->

  $('#edit').editable({inlineMode: false, height: 500})
  $("input.datepicker").datepicker
    language: "ru"

  $("#fileupload").fileupload
    url: "/admin/reviews"
    done: (e, data) ->
      $("#reviews").prepend data.result
      console.log data.result
