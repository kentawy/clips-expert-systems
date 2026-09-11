(defrule find-woman
    (person (name $?name) (gender female))
=>
    (printout t "Знайдено жінку: " $?name crlf)
)