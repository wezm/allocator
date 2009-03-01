#
#  Budget.rb
#  Allocator
#
#  Created by Wesley Moore on 1/03/09.
#  Copyright (c) 2009 __MyCompanyName__. All rights reserved.
#

require 'osx/cocoa'
require 'rubygems'
require 'sequel'
require 'bucket'

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
		zbuckets = @db[:ZBUCKET]
		zbuckets.select(:zname).each do |bucket|
			puts bucket[:ZNAME]
		end
	end

end
