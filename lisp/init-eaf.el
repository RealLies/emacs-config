;;; init-eaf.el --- emacs 的而eaf设置

;;; commentary:
;; emacs启动文件(eaf 设置)

;;; code:


(use-package eaf
  :load-path "~/.emacs.d/emacs-application-framework/" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :custom
  (eaf-find-alternate-file-in-dired t)
  (browse-url-browser-function 'eaf-open-browser) ;; Make EAF Browser my default browser
  :config
  (defalias 'browse-web #'eaf-open-browser)
  (eaf-setq eaf-browser-default-zoom "1.25")
  (eaf-setq eaf-browser-dark-mode "false")

  )



(provide 'init-eaf)
;;; init-eaf.el ends here
