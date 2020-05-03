;;; init-modeline.el --- emacs启动文件(modeline设置)

;;; commentary:
;; emacs启动文件(modeline设置)

;;; code:



(use-package doom-modeline
  :ensure t
  :defer 2
  :hook (after-init . doom-modeline-mode))
 ;      :custom-face
 ;      (mode-line ((t (:height 1))))
 ;      (mode-line-inactive ((t (:height 1))))
 ;      )
 ;      :config
 ;      (setq doom-modeline-height 10)
 ;      (setq doom-modeline--font-height 10)


(provide 'init-modeline)
;;; init-modeline.el ends here
