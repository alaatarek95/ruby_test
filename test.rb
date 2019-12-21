load "stack.rb"
parent = Stack.new
n=0
while n<=100000000
	parent.push(rand(-10000...1000000))
	n+=1
end
parent.max
parent.pop


child = Extra.new

i=0
while i<=10000000
	child.push(rand(-10000...1000000))
	i+=1
end

child.max
child.pop
child.mean
