;;; init-dashboard.el --- emacs启动屏幕

;;; commentary:
;; emacs启动文件(启动扩展屏幕)

;;; code:



(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  :init
  (setq dashboard-banner-logo-title "Hello World")
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
)




(provide 'init-dashboard)
;;; init-dashboard ends here

