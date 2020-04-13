(load "package://pr2eus/pr2.l")
(load "package://pr2eus/pr2-interface.l")

(setq *pr2* (pr2))
(objects (list *pr2*))
(pr2-init)