#!/bin/ruby

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
fptr = File.open(ENV['OUTPUT_PATH'], 'w')

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

    fptr.write count
    fptr.write "\n"
end

fptr.close()
