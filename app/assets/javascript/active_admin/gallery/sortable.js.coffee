$ ->

  setup = ->
    $('fieldset.has_many_images .edit_button a').each ->
      $this = $(@)
      $fieldset = $this.parents('fieldset')
      unless $this.data('wired')
        $this.data('wired', true).click ->
          $fieldset.toggleClass("open")
          false
        $('html').click (e) ->
          unless $.contains($fieldset.get(0), e.target)
            $fieldset.removeClass("open")

    $('fieldset.has_many_images').each ->
      if $('.error', @).length > 0
        $(@).addClass('error')

    $('div.has_many_images').each ->
      $fieldsets = $(@).find("fieldset.has_many_fields")
      $(@).sortable
        opacity: 0.5
        items: $fieldsets
        update: (event, ui) ->
          $(@).find("input[id$=_position]").each (index) -> $(@).val(index + 1)

  $("a").bind "click", -> setTimeout(setup, 50)

  setup()
