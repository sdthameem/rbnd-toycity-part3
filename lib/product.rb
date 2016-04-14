class Product
	attr_reader :title,:price,:stock

	@@products = []
	
	def initialize(options={}) 
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		add_to_products		
	end

	def self.all
		@@products
	end

	def self.find_by_title(find_title)
		@@products.each do |value|
			if value.title == find_title
			   return value
			end
		end
	end

	def in_stock?
		if @stock > 0 
			return true
		else 
			return false
		end
	end

    def self.in_stock
    	@@products.each do |value|
    		if value.stock > 0
    			count+ =1 
    			stock[count] = value
    		end
    	end
    	return stock[]
    end


	private

	def add_to_products
		@@products.each do |value|
			if value.title == @title
			    raise DuplicateProductError , "#{@title} already exists"
			    exit
			end
		end
		@@products << self 
	end
end