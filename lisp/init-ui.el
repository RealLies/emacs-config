;;; init-ui.el --- emacs外观设置启动文件

;;; commentary:
;; emacs启动文件(emacs的外观设置)

;;; code:




;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)


;; 关闭导航栏
(menu-bar-mode -1)


;; 关闭文件滑动控件
(scroll-bar-mode -1)


;; 显示行号
(global-linum-mode 1)


;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)


;; 更改光标的样式
(setq-default cursor-type 'bar)


;; 括号高亮
(show-paren-mode 1)


;; "彩虹括号"式模式
(use-package rainbow-delimiters
  :defer 1
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  )




(provide 'init-ui)
;;; init-ui.el ends here
