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

	class Bucket

		

	end
	
	class Budget

		def initialize(db_path)
			@db = Sequel.sqlite(db_path)
		end

		def buckets
			@buckets ||= load_buckets
		end

		private

		def load_buckets
			@buckets = OSX::NSMutableArray.alloc.init
			zbuckets = @db[:zbucket]
			zbuckets.select(:zname, :zfrequency).each do |row|
			# puts bucket[:zname]
			bucket = Bucket.new(row.name)

			end
		end

	end
	
end