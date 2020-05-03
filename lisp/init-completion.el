;;; init-complete.el --- emacs启动文件
;;; commentary:
;; emacs启动文件(emacs补全文件)

;;; code:



;; company 补全
(use-package company
  :defer 2
  :init
  (global-company-mode t)  ;; 开启company全局支持
  ;; 设置company样式
  ;; (custom-set-faces
 ;; '(company-preview ((t (:background "gold3" :foreground "black"))))
 ;; '(company-preview-common ((t (:background "gold3" :foreground "grey20"))))
 ;; '(company-preview-search ((t (:background "green4" :foreground "green"))))
 ;; '(company-scrollbar-bg ((t (:background "#00212B"))))
 ;; '(company-scrollbar-fg ((t (:background "#48646A"))))
 ;; '(company-tooltip ((t (:background "#00212B" :foreground "#586E75"))))
 ;; '(company-tooltip-annotation ((t (:foreground "gold"))))
 ;; '(company-tooltip-annotation-selection ((t (:foreground "red"))))
 ;; '(company-tooltip-common ((t (:inherit company-tooltip :foreground "#00FFFF"))))
 ;; '(company-tooltip-common-selection ((t (:foreground "#00FFFF"))))
 ;; '(company-tooltip-selection ((t (:background "#45A5A5" :foreground "#586E75")))))
  (setq company-idle-delay 0.08; ;;菜单延迟
        company-show-numbers t ;;显示序号(t/nil)
        company-minimum-prefix-length 1 ;;开始补全字数0
	company-tooltip-align-annotations 1 ;;显示补全注释说明(t/nil)
	company-dabbrev-ignore-case nil     ;;显示小写(t/nil)
	company-dabbrev-downcase nil        ;; 忽略大小写(t/nil)
	company-transformers '(company-sort-by-backend-importance)  ;; 自动排序
	;; company-continue-commands '(not helm-dabbrev)
        )
  :config
  )


;; lsp补全插件
(use-package lsp-mode
  :defer 1
  :commands (lsp)
  :hook
  ;; 开启需要语言补全
  (python-mode . lsp)
  (rust-mode . lsp)
  (html-mode . lsp)
  (css-mode . lsp)
  (js-mode . lsp)
  (tyscript-mode . lsp)
  (json-mode . lsp)
  :init
  (require 'lsp-mode)
  (setq lsp-auto-guess-root nil)      ;; 自动检测项目根目录(t/wnil)
  (setq lsp-auto-configure t)         ;; 自动配置"lsp-ui""company-lsp"(t/nil)
  )


;; 用于flycheck集成和更高级别的UI模块
(use-package lsp-ui
  :defer 1
  :commands lsp-ui
  :config
  (setq lsp-diagnostic-package nil)       ;; 关闭flymake代码检查插件
  (setq lsp-ui-sideline-ignore-duplicate t)
  (setq
   lsp-ui-sideline t
   lsp-ui-sideline-enable t         ;; 是否启用lsp-ui-sideline
   lsp-ui-sideline-show-symbol t    ;; 显示信息右侧的符号名称
   lsp-ui-sideline-show-hover t     ;; 是否在旁边显示悬停消息
   lsp-ui-sideline-show-code-actions t ;; 是否在副业中显示代码操作
   lsp-ui-doc-enable t              ;; 是否启用lsp-ui-doc
   lsp-ui-doc-include-signature t   ;; 在框架中包含对象签名/类型
   lsp-ui-doc-use-childframe t      ;; 是否在子框架或当前框架中显示文档
   lsp-ui-doc-max-width 200         ;; 设置lsp-ui-doc宽度
   lsp-ui-doc-max-height 30         ;; 设置lsp-ui-doc高度
   )
  )


;; 下载company-lsp用于完成
(use-package company-lsp
  :defer 1
  :commands company-lsp
  :config
  (push 'company-lsp company-backends)
  )


;; lsp-mode和treemacs之间的集成以及使用treemacs作为树渲染器的treeview控件的实现
(use-package lsp-treemacs
  :defer 1
  :config
  
)


;; 下载python支持
(use-package python-mode
  :ensure nil
  :after flycheck
  :mode "\\.py\\'"
  :custom
  (python-indent-offset 4)
  (flycheck-python-pycompile-executable "python3")
  (python-shell-interpreter "python3"))


;; 下载python的lsp服务器
(use-package lsp-python-ms
  :after lsp-mode python
  :custom
  (lsp-python-executable-cmd "python3"))


;; 代码检查插件flycheck
(use-package flycheck
  :defer 1
  :init
  (global-flycheck-mode)  ;; 开启全局flycheck
)


;;自动补全括号等插件smartparens
(use-package smartparens
  :defer 1
  :init
  (require 'smartparens-config)
  (smartparens-global-mode t)   ;;开启全局smartparens
  )


;; 代码块插件
(use-package yasnippet
  :defer 1
  :init
  :config
  (yas-global-mode 1)
  (yas-global-mode)
  (yas-load-directory "~/.emacs.d//snippets")
  )


;;下载company-tabnine补全插件
;; (use-package company-tabnine
;;   :defer 1
;;   :init
;;   (add-to-list 'company-backends #'company-tabnine)
;;   ;; Trigger completion immediately.
;;   (setq company-idle-delay t)
;;   ;; Use the tab-and-go frontend.
;;   ;; Allows TAB to select and complete at the same time.
;;   (company-tng-configure-default)
;;   (setq company-frontends
;; 	'(company-tng-frontend
;; 	  company-pseudo-tooltip-frontend
;; 	  company-echo-metadata-frontend)
;; 	)
;;   (require 'company-tabnine)
;;   )
(use-package company-tabnine
  :defer 1
  :custom
  (company-tabnine-max-num-results 9)
  :bind
  (("M-q" . company-other-backend)
   ("C-c t b" . company-tabnine))
  :hook
  (lsp-after-open . (lambda ()
                      (setq company-tabnine-max-num-results 3)
                      (add-to-list 'company-transformers 'company//sort-by-tabnine t)
                      (add-to-list 'company-backends '(company-lsp :with company-tabnine :separate))))
  (kill-emacs . company-tabnine-kill-process)
  :config
  ;; Enable TabNine on default
  (add-to-list 'company-backends #'company-tabnine)

  ;; Integrate company-tabnine with lsp-mode
  (defun company//sort-by-tabnine (candidates)
    (if (or (functionp company-backend)
            (not (and (listp company-backend) (memq 'company-tabnine company-backend))))
        candidates
      (let ((candidates-table (make-hash-table :test #'equal))
            candidates-lsp
            candidates-tabnine)
        (dolist (candidate candidates)
          (if (eq (get-text-property 0 'company-backend candidate)
                  'company-tabnine)
              (unless (gethash candidate candidates-table)
                (push candidate candidates-tabnine))
            (push candidate candidates-lsp)
            (puthash candidate t candidates-table)))
        (setq candidates-lsp (nreverse candidates-lsp))
        (setq candidates-tabnine (nreverse candidates-tabnine))
        (nconc (seq-take candidates-tabnine 3)
               (seq-take candidates-lsp 6))))))



;; 下载json 支持
(use-package json-mode
  :defer 1
  :init
  (require 'json-mode)
  )



;; 下载typescript 支持
(use-package typescript-mode
  :defer 1
  :init
  (require 'typescript-mode)
  )


;; ;; 下载web-mode 支持
;; (use-package web-mode
;;   :defer 1
;;   :init
  
;;   (require 'web-mode)
;;   )

;; 下载rust支持
(use-package rust-mode
  :defer 1
  :init
  (require 'rust-mode)
 )

;; 注册启用rust服务器
(lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "rls")
                    :major-modes '(rust-mode)
                    :server-id 'rls))








;; 下载html 的emmet支持
(use-package emmet-mode
  :defer 1
  :hook
  (html-mode ' emmet)
  ;; :bind
  ;; ("C-j" . emmet-expand-line)
  :init
  (require 'emmet-mode)
 )

(provide 'init-completion)
;;; init-completion.el ends here
