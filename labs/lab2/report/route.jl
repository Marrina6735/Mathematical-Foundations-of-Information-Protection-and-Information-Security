function route_encrypt(message, key, rows, cols)
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
end

message = "this is a test message!"
rows, cols = 4, 5
key = "water"
println(route_encrypt(message, key, rows, cols))
