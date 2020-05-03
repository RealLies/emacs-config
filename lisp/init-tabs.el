;;; init-tabs.el --- emacs启动文件(标签设置)

;;; commentary:
;; emacs启动文件(标签设置)

;;; code:




;; (use-package centaur-tabs
;;   :demand
;;   :config
;;   (centaur-tabs-mode t)                          ;; (启用centaur-tabs-mode)
;;   (centaur-tabs-headline-match)                  ;; (标题面与centaur-tabs-default面相匹配)
;;   (setq centaur-tabs-style "bar")                ;; (更改选项卡样式)
;;   (setq centaur-tabs-height 20)                  ;; (更改标签高度)
;;   (setq centaur-tabs-set-icons t)                ;; (所有图标显示主题图标)
;;   (setq centaur-tabs-gray-out-icons 'buffer)     ;; (使未选定标签的图标变灰)
;;   (setq centaur-tabs-set-bar 'left)              ;; (在所选选项卡的左侧显示彩色条)
;;   :bind
;;   )


(use-package all-the-icons
  :defer 1
  :init
  )




(provide 'init-tabs)
;;; init-tabs.el ends theme
