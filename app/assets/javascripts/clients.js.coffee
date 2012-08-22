jQuery ->
  
  autocomplete_opts = {
    source: $('#item_description_source').data('autocomplete-source'),
    autoFocus: true,
    minLength: 0,
    delay: 0
  }

  $('#search').focus()
  $('#client_name').focus()

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('div').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    data_fields = $($(this).data('fields').replace(regexp, time))
    $('.item-description', data_fields).autocomplete(autocomplete_opts)
    console.log(data_fields)
    $(this).before(data_fields)
    event.preventDefault()
  
  $('.datepicker').datepicker({ closeText: 'Fermer', prevText: '&#x3c;Préc', nextText: 'Suiv&#x3e;', currentText: 'Courant', monthNames: ['Janvier','Février','Mars','Avril','Mai','Juin', 'Juillet','Août','Septembre','Octobre','Novembre','Décembre'], monthNamesShort: ['Jan','Fév','Mar','Avr','Mai','Jun', 'Jul','Aoû','Sep','Oct','Nov','Déc'], dayNames: ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi'], dayNamesShort: ['Dim','Lun','Mar','Mer','Jeu','Ven','Sam'], dayNamesMin: ['Di','Lu','Ma','Me','Je','Ve','Sa'], weekHeader: 'Sm', dateFormat: 'dd/mm/yy', firstDay: 1, isRTL: false, showMonthAfterYear: false, yearSuffix: ''})

  $.datepicker.regional['fr'] = { closeText: 'Fermer', prevText: '&#x3c;Préc', nextText: 'Suiv&#x3e;', currentText: 'Courant', monthNames: ['Janvier','Février','Mars','Avril','Mai','Juin', 'Juillet','Août','Septembre','Octobre','Novembre','Décembre'], monthNamesShort: ['Jan','Fév','Mar','Avr','Mai','Jun', 'Jul','Aoû','Sep','Oct','Nov','Déc'], dayNames: ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi'], dayNamesShort: ['Dim','Lun','Mar','Mer','Jeu','Ven','Sam'], dayNamesMin: ['Di','Lu','Ma','Me','Je','Ve','Sa'], weekHeader: 'Sm', dateFormat: 'dd/mm/yy', firstDay: 1, isRTL: false, showMonthAfterYear: false, yearSuffix: ''};


  $('.item-description').autocomplete(autocomplete_opts)
