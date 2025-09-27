function rails_encrypt(text, key, k)
        grid = fill(" ", 2 * k, 2 * k)
        matrix = fill(" ", k, k)
        index = 1
        new_message = ""
        text = replace(text, " " => "")
        for i in 1:k
                for j in 1:k
                        grid[i, j] = string(index)
                        matrix[i, j] = string(index)
                        index += 1
                end
        end
        for i = 1:(size(grid)[1])
                for j = (size(grid)[1]):-1:1
                        if grid[i, j] == " "
                                matrix = rotr90(matrix)
                                grid[(i+k-1):-1:i, j:-1:(j-k+1)] = matrix[k:-1:1, k:-1:1]
                        end
                end
        end

        index = 1
        arr = Vector{String}()

        for r in text
                checker = false
                for i = 1:(size(grid)[1])
                        for j = 1:(size(grid)[2])
                                if grid[i, j] == string(index) && checker == false
                                        if ((string(i + 1, " ", j) ∉ arr) && (string(i - 1, " ", j) ∉ arr) && (string(i, " ", j - 1) ∉ arr) && (string(i, " ", j + 1) ∉ arr))
                                                grid[i, j] = string(r)
                                                push!(arr, string(i, " ", j))
                                                checker = true
                                        end
                                end
                        end
                        if checker == true
                                index += 1
                                if index > k^2
                                        index = 1
                                        empty!(arr)
                                end
                                break
                        end
                end
        end

        for j in sort(collect(key))
                for i = 1:2k
                        new_message *= (grid[i, (findfirst(j, key))])
                        if tryparse(Float64, string(last(new_message))) != nothing
                                new_message = replace(new_message, last(new_message) => ' ')
                        end
                end
        end
        return new_message

end

text = "Hello, New World!"
key = "keys"
k = 2
println(rails_encrypt(text, key, k))
