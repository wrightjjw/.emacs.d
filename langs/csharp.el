(use-package csharp-mode
  :ensure t)

(when use-lsp-mode
  (add-hook 'csharp-mode-hook #'lsp-deferred))
