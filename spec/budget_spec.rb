#
#  budget_spec.rb
#  Allocator
#
#  Created by Wesley Moore on 1/03/09.
#  Copyright (c) 2009 __MyCompanyName__. All rights reserved.
#

require 'budget'

describe "Opening a moneywell file" do

	before do
		@file = 'test.moneywell'
	end

	it "should connect to the db file" do
		mock_db = mock('db')
		Sequel.should_receive(:sqlite).with(@file).and_return(mock_db)
		budget = Budget.new(@file)
		
	end

end