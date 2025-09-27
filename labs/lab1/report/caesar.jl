enc = ARGS[1]
msg = ARGS[2]
key = parse(Int, ARGS[3])


function encrypt()
        result = ""
        for c in msg
                if 1041 < Int(c) < 1104
                        base = (uppercase(c) == c) ? codepoint('А') : codepoint('а')
                        # 31 - так как в ASCII ё -- пропущена в списке
                        t = base + (Int(Char(c)) % base + key) % 31
                else
                        base = (uppercase(c) == c) ? codepoint('A') : codepoint('a')
                        t = base + (Int(Char(c)) % base + key) % 26
                end
                key_rot = Char(t)
                result = result * key_rot
        end
        result
end

if enc == "e"
        key = key
elseif enc == "d"
        if 1041 < Int(msg[1]) < 1104
                # 31 - так как в ASCII ё -- пропущена в списке
                key = 31 - key
        else
                key = 26 - key
        end
else
        println("Wrong argument. Possible values are 'd' or 'e'")
        exit(1)
end

msg = encrypt()
println(msg)
