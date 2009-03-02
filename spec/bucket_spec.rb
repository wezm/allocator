require 'allocator'


describe Allocator::Bucket do

	before do
		@bucket = Allocator::Bucket.alloc.initWithName('Bucket name')
	end

	describe "#name" do
	
		it "can be accessed directly" do
			@bucket.name.should == 'Bucket name'
		end
	
		it "can be accessed by key value coding" do
			name = @bucket.valueForKey('name').should == 'Bucket name'
		end
		
	end

end