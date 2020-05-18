;;; init-modeline.el --- emacs启动文件(modeline设置)

;;; commentary:
;; emacs启动文件(modeline设置)

;;; code:



(use-package doom-modeline
  :ensure t
  :defer 1
  :hook (after-init . doom-modeline-mode)
  :config
  ;; 显示电量
  (display-battery-mode 1)
  ;; 显示时间
  (display-time-mode 1)
  ;; 显示日期
  (setq display-time-day-and-date t)

   ;; This causes the current time in the mode line to be displayed in
 ;; `egoge-display-time-face' to make it stand out visually.
 (setq display-time-string-forms
       '((propertize (concat " " 24-hours ":" minutes " ")
 		    'face 'egoge-display-time)))

  (setq global-mode-string
    '("" emms-mode-line-string " " emms-playing-time-string "" display-time-string))



  
  ;; Whether display icons in the mode-line. Respects `all-the-icons-color-icons'.
  ;; While using the server mode in GUI, should set the value explicitly.
  (setq doom-modeline-icon (display-graphic-p))

  ;; Whether display the icon for `major-mode'. Respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Whether display the colorful icon for `major-mode'.
  ;; Respects `doom-modeline-major-mode-icon'.
  (setq doom-modeline-major-mode-color-icon t)

  ;; 是否显示缩进信息。
  (setq doom-modeline-indent-info nil)

  ;; 是否显示模式状态图标
  (setq doom-modeline-display-default-persp-name t)
)


(provide 'init-modeline)
;;; init-modeline.el ends here
