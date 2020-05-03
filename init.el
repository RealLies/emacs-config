;;; init.el --- emacsemacs启动根文件

;;; commentary:
;; emacs启动文件(emacs启动根文件)

;;; code:

;; (let (
;;       ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
;;       (gc-cons-threshold most-positive-fixnum)
;;       (file-name-handler-alist nil)
;;       ))




(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-packages)           ;; 插件源管理
(require 'init-ui)                 ;; 视觉层配置
(require 'init-better-defaults)    ;; 增强内置功能
(require 'init-keybindings)        ;; 快捷键绑定
(require 'init-org)                ;; Org 模式相关的全部设定
(require 'init-myfunc)             ;; 自定义函数
(require 'init-completion)         ;; 代码补全设置
(require 'init-shell)              ;; shell设置
;;(require 'init-helm)               ;; helm设置
(require 'init-dashboard)          ;; emacs启动界面
(require 'init-ivy)                ;; emacs迷你缓冲区灵活简单工具
(require 'init-exwm)               ;; emacs的平铺桌面exwm设置
(require 'init-shell)              ;; emacs的shell设置
(require 'init-theme)              ;; emacs的主题设置
(require 'init-tabs)               ;; emacs的tabs设置
(require 'init-modeline)           ;; emacs的modeline设置
(require 'init-pyim)               ;; emacs的中文输入法
(require 'init-icon)               ;; emacs的图标设置
(require 'init-font)               ;; emacs字体设置
(require 'init-googletranslate)    ;; emacs谷歌翻译

(provide 'init)
;;; init.el ends here


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-package-update-delete-old-versions t)
 '(auto-package-update-hide-results t)
 '(auto-package-update-interval 7)
 '(auto-package-update-prompt-before-update t)
 '(company-tabnine-max-num-results 9 t)
 '(flycheck-python-pycompile-executable "python3")
 '(lsp-python-executable-cmd "python3" t)
 '(package-selected-packages
   '(treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile treemacs-evil lsp-treemacs sudo-edit pyim yasnippet which-key vterm use-package undo-tree typescript-mode string-inflection smartparens rust-mode rainbow-delimiters quickrun ox-twbs org-drill org-bullets org-brain ob-rust neotree lsp-ui lsp-python-ms json-mode iedit htmlize highlight-indent-guides google-translate format-all flycheck expand-region emmet-mode dumb-jump dracula-theme doom-modeline diminish dashboard counsel company-tabnine company-lsp auto-package-update ace-window))
 '(python-indent-offset 4)
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
