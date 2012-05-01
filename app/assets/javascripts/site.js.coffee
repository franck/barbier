jQuery ->
  if ace?
    html_editor = ace.edit("html_editor")
    html_editor.setTheme("ace/theme/textmate")
    HTMLMode = require("ace/mode/html").Mode
    html_editor.getSession().setMode(new HTMLMode())

    css_editor = ace.edit("css_editor")
    CSSMode = require("ace/mode/css").Mode
    css_editor.getSession().setMode(new CSSMode())

    $('a[data-toggle="tab"]').on('shown', (e) ->
      css_editor.setTheme("ace/theme/textmate")  
    )


    $("#theme_html").hide()
    $("#theme_css").hide()
    $(".theme_form").submit ->
      $("#theme_html").val(html_editor.getSession().getValue())
      $("#theme_css").val(css_editor.getSession().getValue())
