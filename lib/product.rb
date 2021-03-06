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
    	stock_array = []
    	@@products.each_with_index do |value,index|
    		if value.stock > 0
    			stock_array[index] = value
    		end
    	end
    	return stock_array
    end

    def include?(product_name)
    	if @title == product_name
    		return true
    	else
    		return false
    	end
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