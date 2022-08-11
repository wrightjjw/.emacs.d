(use-package powershell
  :ensure t)

(when use-lsp-mode
  (add-hook 'powershell-mode-hook #'lsp-deferred))
