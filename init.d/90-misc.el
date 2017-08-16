;; (require 'yasnippet)
;; (yas-global-mode 1)
;; (add-hook 'after-init-hook 'global-company-mode)
;; (global-company-mode)

(smartparens-global-mode t)
(show-smartparens-global-mode t)
(smartparens-global-strict-mode)
(require 'smartparens-config)
(require 'smartparens-ruby)
(require 'smartparens-latex)


;; (sp-use-smartparens-bindings)
;; (define-key smartparens-mode-map (kbd "M-<right>") 'sp-forward-slurp-sexp)
;; (define-key smartparens-mode-map (kbd "M-<left>") 'sp-backward-barf-sexp)
;; (define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
;; (define-key smartparens-mode-map (kbd "C-M-<up>") 'sp-backward-slurp-sexp)

(add-hook 'after-init-hook 'smartparens-strict-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


(require 'undo-tree)
(global-undo-tree-mode)

;; https://tickething.com/entity/8656 -> [:ticket: #8656](https://tickething.com/entity/8656)
;; Will take the last part of the url as the ticket id and make a nice markdown link
;; The link will be pasted at the current cursor point and will copy it to the clipboard
(defun at/md-ticket-link ()
  (interactive)
  (insert
   (let* (
          (url (x-get-clipboard))
          (id (replace-regexp-in-string ".*/" "" url))
          (ticket-string (concat "[:ticket: #" id "](" url ")")))
     (kill-new ticket-string))))



(require 'epa-file)
(epa-file-enable)




;; Latex
(add-hook 'latex-mode-hook 'turn-on-flyspell)

(setq elfeed-feeds
   (quote
    (
     "http://irreal.org/blog/?feed=rss2" "http://rachelbythebay.com/w/atom.xml" "http://emacsredux.com/atom.xml" "http://ferd.ca/feed.rss" "http://feeds.feedburner.com/emacsrookiecom" "http://design-fetish.blogspot.com/feeds/posts/default" "http://www.quantnews.com/rss2.php" "http://contagiodump.blogspot.com/feeds/posts/default" "http://googleresearch.blogspot.com/feeds/posts/default" "http://log.metalab.at/rss" "http://monochrom.at/blog/rss.php?blogId=1&profile=atom" "http://post-engineering.blogspot.com/feeds/posts/default" "http://itsonlymusicbutlive.com/feed/" "http://shitphotojournalistslike.tumblr.com/rss" "http://blackgirldangerous.tumblr.com/rss" "http://feeds.feedburner.com/Quantocracy" "http://cinematedman.blogspot.com/feeds/posts/default" "http://www.theppk.com/feed/" "http://www.myextralife.com/feed/" "http://blog.willj.net/feed/" "http://haskellweekly.tumblr.com/rss" "http://www.1stfloorgraphics.nl/feed/" "http://www.heise.de/security/news/news-atom.xml" "http://emacsblog.org/feed/" "http://www.rainbowzombiesatemyunicorn.de/wp/feed" "http://dearphotograph.com/rss" "http://data-sorcery.org/feed/" "http://sludgeswamp.blogspot.com/feeds/posts/default" "http://planet.clojure.in/atom.xml" "http://feeds.feedburner.com/fadeyev" "http://www.informatik.tuwien.ac.at/rss.xml" "http://fsinf.at/node/feed" "http://www.dearcoffeeiloveyou.com/feed/" "http://www.milw0rm.com/rss.php" "http://feeds.feedburner.com/ThePassionateProgrammer" "http://continuous.io/feed/" "http://dougireton.com/atom.xml" "http://nelhagedebugsshit.tumblr.com/rss" "http://elias-thok.tumblr.com/rss" "http://devopsanywhere.blogspot.com/feeds/posts/default" "http://feeds.feedburner.com/Explosm" "http://citizen428.net/atom.xml" "http://dailyssrn.com/rss/rss-all-2.0.xml" "http://feeds.feedburner.com/Clojure/coreBlog" "http://oremacs.com/atom.xml" "http://endlessparentheses.com/atom.xml" "http://feeds.feedburner.com/jmboard/UITV" "http://zedshaw.com/feed.xml" "http://axecop.com/index.php/achome/Axe_Cop_RSS/" "http://deathelectro.com/feed/" "http://www.blackforestmag.com/feed/" "http://feeds.feedburner.com/design-milk" "http://feed.dilbert.com/dilbert/daily_strip" "http://flowingdata.com/feed/" "https://lobste.rs/rss" "http://en.rsf.org/spip.php?page=backend&lang=en" "http://batsov.com/atom.xml" "http://curiositycounts.com/rss" "http://oppugn.us/feed.xml" "http://www.stonerobixxx.net/rss" "http://feeds.feedburner.com/Octocats" "http://www.shabka.org/feed/" "http://googleappengine.blogspot.com/feeds/posts/default" "http://xkcd.com/atom.xml" "http://www.sitepoint.com/ruby/feed/" "http://afreshcup.com/home/rss.xml" "http://feeds2.feedburner.com/Rubyflow" "http://thefoundation.libsyn.com/rss" "http://alioutfit.tumblr.com/rss" "http://reborg.tumblr.com/rss" "http://whoworeitbetter.info/rss" "http://feeds.feedburner.com/typepad/petewarden" "http://morethanalogo.blogspot.com/feeds/posts/default" "http://calnewport.com/blog/feed/" "http://datastori.es/feed/" "http://feeds.feedburner.com/solnic-on-blog/" "http://iamtrask.github.io/feed.xml" "http://lambda-the-ultimate.org/rss.xml" "http://feeds.feedburner.com/IeeeSpectrum" "http://feeds.cyberciti.biz/Nixcraft-LinuxFreebsdSolarisTipsTricks" "http://jabberwocky.eu/atom.xml" "http://feeds.feedburner.com/InformationIsBeautiful" "http://blog.circleci.com/feed/rss/" "http://killuminati-tv.blogspot.com/feeds/posts/default" "http://bits.blogs.nytimes.com/feed/" "http://www.tuwien.ac.at/index.php?id=157&type=100" "http://feeds.feedburner.com/nosql" "http://blog.netbsd.org/tnf/feed/entries/atom" "http://feeds.feedburner.com/NukedFromOrbit" "http://blog.codeship.io/feed" "http://itstartedwithafight.de/feed/" "http://feeds.feedburner.com/VirtuousCode?format=xml" "http://feeds.feedburner.com/Poolga" "http://totallyveg.blogspot.com/feeds/posts/default" "http://stilldrinking.org/rss/feed.xml" "http://365blanc.blogspot.com/feeds/posts/default" "http://www.symmetrymagazine.org/feed" "https://luminous-landscape.com/feed/" "http://feeds.feedburner.com/rails-bestpractices" "http://feeds.feedburner.com/SuitpossumFragmentsOfFinancialSubversion" "http://feeds.feedburner.com/HighScalability" "http://emacsrocks.com/atom.xml" "http://www.lawblog.de/index.php/feed/" "https://krypt3ia.wordpress.com/feed/" "http://thehackerblog.com/feed/" "http://feeds.feedburner.com/thechangelog" "https://github.com/blog.atom" "http://www.commitstrip.com/en/feed/" "http://atlasobscura.com.feedsportal.com/c/35387/f/665719/index.rss" "http://blog.whatwg.org/feed" "http://theoatmeal.com/feed/rss" "http://about.travis-ci.org/blog.xml" "http://theveganstoner.blogspot.com/feeds/posts/default" "https://firstlook.org/theintercept/feed/?rss" "http://feeds.feedburner.com/LearningRubyBlog" "http://www.lastnerdsonearth.com/feed/" "http://nullprogram.com/feed/" "http://planet.emacsen.org/atom.xml" "https://krebsonsecurity.com/feed/")))
