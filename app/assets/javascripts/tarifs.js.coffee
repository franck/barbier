jQuery ->
  $("ul.reorder").sortable
    axis: 'y'
    handle: '.handle'
    update: ->
      console.log($(this).data('update-url'))
      console.log($(this).sortable('serialize'))
      $.post($(this).data('update-url'), $(this).sortable('serialize'));
