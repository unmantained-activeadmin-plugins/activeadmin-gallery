$ ->
  $('.has_many').each ->
    that = this
    $('fieldset.has_many_fields', that).parent().sortable
      opacity: 0.5
      items: "fieldset.has_many_fields"
      update: (event, ui) ->
        $('fieldset.has_many_fields', that).each (index) ->
          $('input[id$="position"]', this).val index+1
          $('h4 > .position', this).text index+1
