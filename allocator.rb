require 'osx/cocoa'
require 'rubygems'
require 'sequel'

module Allocator
	
	FREQUENCIES = [
		'No Plan',
		'Daily',
		'Weekly',
		'Fortnightly',
		'Twice a month',
		'Monthly',
		'Every two months',
		'Quarterly',
		'Twice a year',
		'Annually',
	]

	class Bucket < OSX::NSObject

		def initWithName(name)
			@name = name #OSX::NSString.alloc.initWithString(name)
			init
			self
		end
		
		attr_reader :name
				
		def allocation
			0
		end

	end
	
	class Budget

		def initialize
			@buckets = []
		end

		attr_reader :buckets

		def load_buckets_from_file(db_path)
			@db = Sequel.sqlite(db_path)
			zbuckets = @db[:zbucket]
			zbuckets.select(:zname, :zfrequency).where(:zishidden => 0).each do |row|
				@buckets << Bucket.alloc.initWithName(row[:ZNAME])
			end
		end

	end
	
end