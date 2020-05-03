;;; init-better-defaults.el --- emacs增强内置功能启动文件

;;; commentary:
;; emacs启动文件(emacs增强内置功能文件)

;;; code:




;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)


;; 禁止 Emacs 自动生成备份文件
(setq make-backup-files nil)


;; 设置yes,no简写
(fset 'yes-or-no-p'y-or-n-p)


;; 关闭自动保存文件
(setq auto-save-default nil)


;; 高亮当前行，当文本内容很多时可以很容易找到光标的位置
(global-hl-line-mode 1)


;; 非选中窗口禁用光标
(setq-default cursor-in-non-selected-windows nil)

;; 自动更新buffer变更文件
(global-auto-revert-mode t)


;; 自动变更周期
;; （setq auto-revert-interval 3)


;; 快速打开最近 编辑过的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 25)  ;; 最大保存数目

;; 共享剪切板
(setq select-enable-clipboard t)


;; 垃圾回收阀值
(setq gc-cons-threshold (* 50 3000 3000))


;; tab缩进改为space
;; (setq-default indent-tabs-mode nil)

;;(split-window-below -10)



;; 快速选择插件
(use-package expand-region
  :defer 1
  :init
  (require 'expand-region)
  (global-set-key (kbd "C-=") 'er/expand-region)
  )


;; 快速编辑多个区域
(use-package iedit
  :defer 1
  :bind
  ("C-c C-." . iedit-mode)
  :init
  (require 'iedit)

  )


;; 一种全局次要模式
(when (fboundp 'winner-mode)
  (winner-mode 1))


;; 撤销历史树
(use-package undo-tree
  :defer 1
  :init
  (global-undo-tree-mode)
  )



;; 文件树

;; (use-package neotree
;;   :ensure t
;;   :bind
;;   ("C-c n" . neotree-show)
;;   :config
;;   (setq inhibit-compacting-font-caches t)
;;   (setq neo-theme 'icons))
(use-package treemacs
  :ensure t
  :defer t
  :bind
  ("M-0" . treemacs-select-window)
  :init
  ;; (with-eval-after-load 'winum
  ;;   (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-width                         35
	  )

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    (treemacs-resize-icons 16)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)
  )
)

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-persp
  :after treemacs persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

;; 缩进线
(use-package highlight-indent-guides
  :ensure t
  :demand t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'top)
  )


;; 名称转换
(use-package string-inflection
  :ensure t
  :init
  (global-set-key (kbd "C-c C-u") 'string-inflection-all-cycle)
  (require 'string-inflection)

  )


;; 快速跳转
(use-package avy
  :ensure t
  :bind
  ("C-c C-;" . avy-goto-char)
  :init
  )


;; 可从模式行中删除某些次要模式
(use-package diminish)


;; 快速运行代码
(use-package quickrun
  :bind
  (
   ("C-c C-q r" . quickrun)
   ("C-c C-q R" . quickrun-shell)
   )
  )


;; 跳转到定义
(use-package dumb-jump
  :ensure t
  :bind
  ;; 尝试跳至所指事物的定义
  ("C-c M-g" . dumb-jump-go-other-window)
  ;; 跳回到跳回原来的位置
  ("C-c M-p" . dumb-jump-back)
  ;; 提示用户跳转功能
  ("C-c M-i" . dumb-jump-go-prompt)
  :init
  ;; 使用ivy代替多个选项的默认弹出窗口
  (setq dumb-jump-selector 'ivy)
  ;; 如果未找到默认项目,则更改默认项目
  (setq dumb-jump-default-project "~")
  )


;; ;; 模糊查找
;; (use-package snails
;;   :load-path (lambda () (expand-file-name "~/.emacs.d/snails-master/" user-emacs-directory))
;;   :custom-face
;;   (snails-content-buffer-face ((t (:background "#111" :height 110))))
;;   (snails-input-buffer-face ((t (:background "#222" :foreground "gold" :height 110))))
;;   (snails-header-line-face ((t (:inherit font-lock-function-name-face :underline t :height 1.1))))
;;   :init
;;   (use-package exec-path-from-shell :if (featurep 'cocoa) :defer t)
;;   :config
;;   ;; Functions for specific backends
;;   (defun snails-current-project ()
;;     (interactive)
;;     (snails '(snails-backend-projectile snails-backend-rg snails-backend-fd)))
;;   (defun snails-active-recent-buffers ()
;;     (interactive)
;;     (snails '(snails-backend-buffer snails-backend-recentf)))
;;   (defun snails-everywhere ()
;;     (interactive)
;;     (snails '(snails-backend-everything snails-backend-mdfind))))


;; 
(use-package format-all
  :bind ("C-c M-\\" . format-all-buffer))


(provide 'init-better-defaults)
;;; init-better-defaults.el ends here
