(setq use-lsp-mode 't)

;;;; LSP
(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-comand-keymap (suggested alternatives: "C-c l", "C-l")
  (setq lsp-keymap-prefix "C-l")
  :hook ;; modes to use for LSP
  (lsp-mode . lsp-enable-which-key-integration)
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)
