#= require 'filereader'

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

      $fieldset = $(@)
      if window.File && window.FileReader
        $fieldset.find('input[type=file]').fileReaderJS
          readAsMap:
            'image/*': 'DataURL'
          on:
            load: (e, file) ->
              if file.type.match(/image/)
                # Create a thumbnail and add it to the output if it is an image
                img = new Image()
                img.onload = -> $fieldset.find('.image_preview').html(img)
                img.src = e.target.result
              else
                # Fallback: display file name
                filename = $fieldset.find('input[type=file]').val().split(/(\\|\/)/g).pop()
                $fieldset.find('.image_preview').html "<div class='no_image'>#{filename}</div>"
      else
        # Fallback: display file name
        $fieldset.find('input[type=file]').change ->
          filename = $(@).val().split(/(\\|\/)/g).pop()
          $fieldset.find('.image_preview').html "<div class='no_image'>#{filename}</div>"

    $('div.has_many_images').each ->
      $fieldsets = $(@).find("fieldset.has_many_fields")
      $(@).sortable
        revert: 250
        opacity: 0.5
        items: $fieldsets
        update: (event, ui) ->
          $(@).find("input[id$=_position]").each (index) -> $(@).val(index + 1)

  $("a").bind "click", -> setTimeout(setup, 50)

  setup()
