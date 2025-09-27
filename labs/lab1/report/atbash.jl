enc = ARGS[1]
msg = ARGS[2]
alp = ARGS[3]
rev = reverse(ARGS[3])

function atbash(msg, alp, rev)
        result = ""
        for i in msg
                c = rev[findfirst(i, alp)]
                result = result * c
        end
        result
end

e = atbash(msg, alp, rev)
println(e)
println(atbash(e, rev, alp))
