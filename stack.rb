class Stack
	
	# set the main stack to be and empty array and max number to be zero 
	def initialize

	    @main_stack = []
	    @max_number = 0
	end
	# this stack accept only unsigned integers
	# case x is the first item to be pushed it will be the max number in this case
	# case x is less than the max number it will be pushed to the array only withour any calculations 
	# case x is bigger that the max number:
	# 					- in the main stack the number will be added as x * 2 - the old max number
	# 					- the new max number is the value of x without any changes 
	# this small equation is to avoid using 2 stacks or a loop and to make the time complexity O(1)
    def push x

    	return if !(x.is_a?Integer) || x <= 1

    	@number = x
        if @main_stack.empty?
        	@main_stack <<  x
        	@max_number = x 
        else
        	if x > @max_number
            @main_stack << x * 2 - @max_number
            @max_number = x 
	        else
	        	@main_stack << x
	        end
        end
        print "number is added"
         
    end

    # this function returns the max number that is calculated in either push or pop methods
    def max 
        @max_number
    end


    # case the pop number is greater than the max number this means that it is a calculated value not the real valus
    # the number that is returned must be in its original form
    # the poped number will be the current max number 
    # we use a small equation to revert the one used in the push method to recalculate the max number
    # new max number in this case is 2 * the current max number - the pop number in the stack
    def pop
        pop_number = @main_stack.pop 
        if pop_number > @max_number
        	@removed_number = @max_number
            @max_number = 2 * @max_number -pop_number
            
        else
        	@removed_number = pop_number
        end
        @removed_number
    end
    

end

class Extra  < Stack 

	# use the same inistializer of the parent and add 2 properties 
	def initialize
		super
		@sum = 0
		@no_of_attributes = 0
	end

	# use the parent method , increment the number of attributes and calculate the sum
	def push x
		super
		@no_of_attributes += 1
		@sum += @number
	end
	# use the parent method , decrement the number of attributes and calculate the sum
	def pop 
		super
		@no_of_attributes -= 1
		@sum -= @removed_number
		@removed_number
	end

	#  use the parent method
	def max 
		super
	end

	# returns the calculated average of all the elements in the stack
	def mean 
		@sum / @no_of_attributes
	end

    
end

# I conseder this as the fastest way as it is O(1) 
# I tests it on more that 10,000,000 record
# test code:
# 

# Alaa Tarek 21-12-2019