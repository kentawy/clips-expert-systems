; Задаємо базові факти
(deffacts base-family
    (father-of Tom John)
    (mother-of Susan John)
    (is-male John)
)

; Правило 1: Якщо є батько і мати, то вони є спільними батьками
(defrule find-parents
    (father-of ?f ?child)
    (mother-of ?m ?child)
    =>
    (assert (parents-of ?child ?f ?m))
    (printout t "The parents of " ?child " are " ?f " and " ?m crlf)
)

; Правило 2: Логічні висновки для батька (стать та роль)
(defrule father-attributes
    (father-of ?f ?)
    =>
    (assert (is-father ?f))
    (assert (is-male ?f))
    (printout t ?f " is a father" crlf)
    (printout t ?f " is a male" crlf)
)

; Правило 3: Логічні висновки для матері (стать та роль)
(defrule mother-attributes
    (mother-of ?m ?)
    =>
    (assert (is-mother ?m))
    (assert (is-female ?m))
    (printout t ?m " is a mother" crlf)
    (printout t ?m " is a female" crlf)
)

; Правило 4: Якщо особа чоловічої статі має батька, то ця особа - син
(defrule son-attributes
    (is-male ?child)
    (father-of ? ?child)
    =>
    (assert (is-son ?child))
    (printout t ?child " is a son" crlf)
    (printout t ?child " is a male" crlf)
)