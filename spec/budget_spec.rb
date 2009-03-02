#
#  budget_spec.rb
#  Allocator
#
#  Created by Wesley Moore on 1/03/09.
#  Copyright (c) 2009 __MyCompanyName__. All rights reserved.
#

require 'allocator'

describe "Opening a moneywell file" do

	before do
		@budget = Allocator::Budget.new
	end

	it "should connect to the db file" do
		pending "refactor to make class more testable"
		mock_table = mock('table')
		db = {:zbucket => mock_table}
		mock_table.should_receive(:select).with(:zname, :zfrequency).and_return([
			{:name => 'Bucket 1', :zfrequency => 0},
			{:name => 'Bucket 2', :zfrequency => 5},
		])
		Sequel.should_receive(:sqlite).with('test.moneywell').and_return(db)
		@budget.load_buckets_from_file('test.moneywell')
	end
	
	it "should handle connection errors"

end