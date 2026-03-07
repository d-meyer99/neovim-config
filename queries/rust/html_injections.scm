;; html_injection.scm – Rust → HTML injection

((macro_invocation
   macro: (identifier) @macro_name
   (token_tree) @html_content)
 (#eq? @macro_name "html!"))

;; The captured @html_content node will be parsed with the HTML grammar.
