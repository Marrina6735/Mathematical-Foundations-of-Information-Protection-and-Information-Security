---
## Front matter
lang: ru-RU
title: Лабораторная работа №3
subtitle:  Шифрование гаммированием
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

**Шифр гаммирования** — симметричный потоковый шифр, в котором каждый символ открытого текста объединяется с соответствующим символом гаммы с помощью операции сложения по модулю.

**Ключевые особенности:**
- Относится к классу потоковых шифров
- Криптостойкость зависит от длины и случайности гаммы
- При одноразовом ключе — абсолютная криптостойкость

# Цель работы

Целью данной работы является изучение алгоритма шифрования гаммированием, принципа его работы и реализация на языке программирования Julia.

# Задание

1. Реализовать алгоритм шифрования гаммированием
2. Реализовать алгоритм дешифрования
3. Протестировать работу алгоритма на примере

# Выполнение лабораторной работы

## Реализация шифрования

```julia
function gamma_encrypt(text::Vector{Int}, gamma::Vector{Int}, 
                       mod_value::Int=33)
    # Формируем ключевое слово
    keyText = Int[]
    for i in 1:(textLen ÷ gammaLen)
        append!(keyText, gamma)
    end
    # Шифрование
    for i in 1:textLen
        result = (text[i] + keyText[i]) % mod_value
        push!(encrypted, result)
    end
    return encrypted
end
```

# Выполнение лабораторной работы
## Реализация дешифрования

```julia
function gamma_decrypt(encrypted::Vector{Int}, gamma::Vector{Int}, 
                       mod_value::Int=33)
    # Формируем ключевое слово
    keyText = Int[]
    for i in 1:(encryptedLen ÷ gammaLen)
        append!(keyText, gamma)
    end
    # Расшифрование
    for i in 1:encryptedLen
        result = (encrypted[i] - keyText[i]) % mod_value
        if result <= 0
            result += mod_value
        end
        push!(decrypted, result)
    end
    return decrypted
end
```

# Выполнение лабораторной работы
## Тестирование алгоритма

```julia
text = [16, 17, 9, 11, 1, 8] # ПРИКАЗ
gamma = [4, 1, 13, 13, 1] # ГАММА
mod_value = 33

encrypted = gamma_encrypt(text, gamma, mod_value)
decrypted = gamma_decrypt(encrypted, gamma, mod_value)
```

# Выполнение лабораторной работы
## Результаты выполнения

```julia
Исходный текст: [16, 17, 9, 11, 1, 8]
Гамма: [4, 1, 13, 13, 1]
Зашифрованный текст: [20, 18, 22, 24, 2, 12]
Расшифрованный текст: [16, 17, 9, 11, 1, 8]
Исходный текст восстановлен: true
```

# Вывод
В данной лабораторной работе был успешно реализован алгоритм шифрования гаммированием на языке Julia. Алгоритм корректно выполняет как шифрование, так и дешифрование, что подтверждается тестовыми примерами. Реализация демонстрирует принципы работы потоковых шифров и модульной арифметики в криптографии.

# Список литературы
[1] Методические материалы курса.

[2] Wikipedia: Stream cipher

[3] Официальная документация по языку Julia