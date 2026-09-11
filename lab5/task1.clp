; Шаблони для збереження вибору користувача та стадій діалогу
(deftemplate user-preference
    (slot payment-method)
    (slot vacation-type)
)

(deftemplate state
    (slot step)
)

; Початковий стан: запуск запиту методу оплати
(defrule start-dialog
    =>
    (printout t "Оберіть метод оплати (наличные, чек, расчетный_счет): ")
    (assert (user-preference (payment-method (read)) (vacation-type nil)))
    (assert (state (step ask-vacation)))
)

; Друге питання: вибір виду відпочинку
(defrule ask-vacation-type
    ?s <- (state (step ask-vacation))
    ?p <- (user-preference (payment-method ?pm) (vacation-type nil))
    =>
    (retract ?s)
    (printout t "Оберіть різновид місця відпочинку (морской_курорт, горнолыжный_курорт): ")
    (modify ?p (vacation-type (read)))
    (assert (state (step evaluate-recommendation)))
)

; Рекомендація на основі вподобань користувача
(defrule recommend-trip-1
    ?s <- (state (step evaluate-recommendation))
    (user-preference (payment-method наличные) (vacation-type морской_курорт))
    =>
    (retract ?s)
    (printout t "Рекомендація: Економічний морський курорт (оплата готівкою доступна)." crlf)
)

(defrule recommend-trip-2
    ?s <- (state (step evaluate-recommendation))
    (user-preference (payment-method расчетный_счет) (vacation-type горнолыжный_курорт))
    =>
    (retract ?s)
    (printout t "Рекомендація: Елітний гірськолижний курорт (оплата через розрахунковий рахунок)." crlf)
)

(defrule recommend-trip-default
    ?s <- (state (step evaluate-recommendation))
    (user-preference (payment-method ?pm) (vacation-type ?vt))
    =>
    (retract ?s)
    (printout t "Рекомендація: Стандартний тур за вашим запитом (метод: " ?pm ", тип: " ?vt ")." crlf)
)