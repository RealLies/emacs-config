;;; init-keybindings.el --- emacs自定义快捷键启动文件

;;; commentary:
;; emacs启动文件(emacs自定义快捷键)

;;; code:




;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)




;; 前输入的不完整命令()前缀)之后显示键绑定
(use-package which-key
  :ensure t
  :init
  (require 'which-key)
  (which-key-mode)

  ;; location of which-key window. valid values: top, bottom, left, rightx
  (setq which-key-side-window-location 'bottom)

  ;; max width of which-key window, when displayed at left or right.
  ;; valid values: number of columns (integer), or percentage out of current
  ;; frame's width (float larger than 0 and smaller than 1)
  (setq which-key-side-window-max-width 0.33)

  ;; max height of which-key window, when displayed at top or bottom.
  ;; valid values: number of lines (integer), or percentage out of current
  ;; frame's height (float larger than 0 and smaller than 1)
  (setq which-key-side-window-max-height 0.25)

  ;; max width of which-key frame: number of columns (an integer)
  (setq which-key-frame-max-width 60)

  ;; max height of which-key frame: number of lines (an integer)
  (setq which-key-frame-max-height 20)
)

(provide 'init-keybindings)
;;; init-keybindings.el ends here
