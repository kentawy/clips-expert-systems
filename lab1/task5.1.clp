(defrule find-men
    (person (name $?name) (gender male))
=>
    (printout t "Знайдено чоловіка: " $?name crlf)
)