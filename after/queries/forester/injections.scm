
((display_math (_)+  @injection.content (#set! injection.language "latex")))
((inline_math (_)+  @injection.content (#set! injection.language "latex")))

; Inject markdown for text nodes that follow a %md comment
((comment) @_comment (text) @injection.content
 (#match? @_comment "md")
 (#set! injection.language "markdown")
 (#not-has-ancestor? @injection.content "inline_math")
 (#not-has-ancestor? @injection.content "display_math")
 (#not-has-ancestor? @injection.content "code"))
