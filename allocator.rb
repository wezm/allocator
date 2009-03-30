require 'osx/cocoa'
require 'rubygems'
require 'sequel'
require 'date'

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
			@frequency = 0
			@balance = 0
			@target_balance = 0
			@reference_date = OSX::NSDate.alloc.initWithTimeIntervalSinceNow(0)
			init
			self
		end
		
		attr_accessor :name, :frequency, :balance, :reference_date, :target_balance
				
		def allocation
			0
		end
		
		def frequency_name
			FREQUENCIES[@frequency]
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
			zbuckets.where(:zishidden => 0).each do |row|
				@buckets << Bucket.alloc.initWithName(row[:ZNAME])
				p row
			end
		end

	end
	
end