jQuery ->

  set_item_type_class = (item_category) ->
    console.log("on set item type class")
    parent_div = $(item_category).parent('div')
    $(parent_div).removeClass()
    if $(item_category).val() == "Produit"
      parent_div.addClass('item-type-produit')
    else
      parent_div.addClass('item-type-service')

  handle_item_category_change = ->
    set_item_type_class(this)
    item_description = $(this).parents('div').find('.item-description')
    if $(this).val() == 'Produit'
      $(item_description).autocomplete(autocomplete_produit_opts)
    else
      $(item_description).autocomplete(autocomplete_service_opts)
  
  autocomplete_service_opts = {
    source: $('#service_description_source').data('autocomplete-source'),
    autoFocus: true,
    minLength: 0,
    delay: 0
  }

  autocomplete_produit_opts = {
    source: $('#produit_description_source').data('autocomplete-source'),
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
    type = $(this).data('type')
    item_category = $('.item-category', data_fields)
    item_description = $('.item-description', data_fields)
    if type == 'produit'
      item_description.autocomplete(autocomplete_produit_opts)
      item_category.val('Produit')
    else
      item_description.autocomplete(autocomplete_service_opts)
    set_item_type_class(item_category)
    item_category.on('change', handle_item_category_change)
    $("#add-items").before(data_fields)
    event.preventDefault()
  
  $('.datepicker').datepicker({ closeText: 'Fermer', prevText: '&#x3c;Préc', nextText: 'Suiv&#x3e;', currentText: 'Courant', monthNames: ['Janvier','Février','Mars','Avril','Mai','Juin', 'Juillet','Août','Septembre','Octobre','Novembre','Décembre'], monthNamesShort: ['Jan','Fév','Mar','Avr','Mai','Jun', 'Jul','Aoû','Sep','Oct','Nov','Déc'], dayNames: ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi'], dayNamesShort: ['Dim','Lun','Mar','Mer','Jeu','Ven','Sam'], dayNamesMin: ['Di','Lu','Ma','Me','Je','Ve','Sa'], weekHeader: 'Sm', dateFormat: 'dd/mm/yy', firstDay: 1, isRTL: false, showMonthAfterYear: false, yearSuffix: ''})

  $.datepicker.regional['fr'] = { closeText: 'Fermer', prevText: '&#x3c;Préc', nextText: 'Suiv&#x3e;', currentText: 'Courant', monthNames: ['Janvier','Février','Mars','Avril','Mai','Juin', 'Juillet','Août','Septembre','Octobre','Novembre','Décembre'], monthNamesShort: ['Jan','Fév','Mar','Avr','Mai','Jun', 'Jul','Aoû','Sep','Oct','Nov','Déc'], dayNames: ['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi'], dayNamesShort: ['Dim','Lun','Mar','Mer','Jeu','Ven','Sam'], dayNamesMin: ['Di','Lu','Ma','Me','Je','Ve','Sa'], weekHeader: 'Sm', dateFormat: 'dd/mm/yy', firstDay: 1, isRTL: false, showMonthAfterYear: false, yearSuffix: ''};


  $('.item-description').each ->
    if $(this).val() == 'Produit'
      $(this).autocomplete(autocomplete_produit_opts)
    else
      $(this).autocomplete(autocomplete_service_opts)
  
  $('.item-category').on('change', handle_item_category_change)
    

  $('.item-category').each ->
    set_item_type_class(this)
