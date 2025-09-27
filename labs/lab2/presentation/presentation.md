---
## Front matter
lang: ru-RU
title: Лабораторная работа №2
subtitle:  Шифры перестановки
author: |
        Коняева Марина Александровна
        \        
        НФИмд-01-25
        \
        Студ. билет: 1032259383
institute: |
           RUDN
date: | 
      2025

babel-lang: russian
babel-otherlangs: english
mainfont: Arial
monofont: Courier New
fontsize: 9pt

## Formatting
toc: false
slide_level: 2
theme: metropolis
header-includes: 
 - \metroset{progressbar=frametitle,sectionpage=progressbar,numbering=fraction}
 - '\makeatletter'
 - '\beamer@ignorenonframefalse'
 - '\makeatother'
aspectratio: 43
section-titles: true
---

# Теоретическое введение

- Маршрутное шифрование 
Текст записывается в таблицу построчно, а считывается по столбцам в порядке, заданном алфавитной сортировкой букв пароля. Ключ — размер таблицы и пароль.

- Шифрование решёткой Флейснера 
Используется трафарет с прорезями, который поворачивается на 90° после каждого заполнения. Текст вписывается в прорези, а результат считывается из полной таблицы по столбцам согласно паролю.

- Шифр Виженера
Каждая буква текста сдвигается на величину, определяемую соответствующей буквой ключевого слова. Шифрование осуществляется с помощью таблицы или формулы сложения позиций букв по модулю алфавита.

# Цель работы

Целью данной работы является изучение алгоритмов шифрования перестановки,
принцип его работы, реализация на Julia.


# Маршрутное шифрование

Реализация:

```julia
message = filter(!isspace, message)
matrix = fill('_', rows, cols)
index = 1
new_message = ""
for i = 1:rows
        for j = 1:cols
                if index != rows * cols
                        matrix[i, j] = message[index]
                        index += 1
                end
        end
end
for j in sort(collect(key))
        for i = 1:rows
                new_message *= (matrix[i, (findfirst(j, key))])
        end
end
return new_message
```

# Маршрутное шифрование

Выполнение:

```
$ julia route.jl 
hamgses!iss_iteetsta
```

# Шифрование с помощью решеток

Выполнение:

```
$ julia ./rails.jl 
,lr!HNdwoeolle W
```

# Таблица Вижинера

Реализация:

```julia
alphabet = 'a':'z'
output = ""
key_index = 1

for i in text
        if isletter(i)
                offset = findfirst(isequal(key[key_index]), alphabet) - 1
                index = findfirst(isequal(i), alphabet) + offset
                index > 26 && (index -= 26)
                output *= alphabet[index]
                key_index += 1
                key_index > length(key) && (key_index = 1)
        else
                output *= i
        end
end

return output
```

# Таблица Вижинера

Выполнение:

```
$ julia vigener.jl 
rijvs uyvjn
```

# Выводы

В данной лабораторной работе были изучены три шифра перестановки, все алгоритмы были реализованы на языке Julia и работают корректно.

# Список литературы. Библиография

[1] Методические материалы курса.

[2] Wikipedia: Caesar cipher (URL: https://en.wikipedia.org/wiki/Caesar_cipher) 

[3] Официальная документация по языку Julia (URL: https://docs.julialang.org/). 

