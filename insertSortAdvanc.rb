require 'json'
require 'stringio'

class ArvoreBinaria

    def initialize(size)
        @@size = size
        @@tree = [0] * @@size
    end
    def update(index, val)
        while (index <= @@size)
            @@tree[index] += val
            index += (index & -index)
        end
    end
    def read(index)
        soma = 0
        while (index > 0)
            soma += @@tree[index]
            index -= (index & -index)
        end
        return soma
    end
end
main_vector = []
t = gets.to_i
t.times do |t_itr|
    n = gets.to_i
    arr = gets.rstrip.split(' ').map(&:to_i)
    count = 0
    bit =  ArvoreBinaria.new(10**7+1)
    arr.reverse.each do |val|
        bit.update(val, 1)
        count += bit.read(val-1)
    end
    main_vector << count
end
main_vector.map {|count| p count}