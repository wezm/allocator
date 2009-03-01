require 'osx/cocoa'
require 'budget'

class AppController < OSX::NSObject


#	def init
#		if super_init != nil
#			@bud = OSX::NSArray.alloc.init
#		end
#		
#		self
#	end

	ib_outlets :main_window

    ib_action :open_file do |sender|
		open_panel = OSX::NSOpenPanel.openPanel
		open_panel.beginSheetForDirectory_file_types_modalForWindow_modalDelegate_didEndSelector_contextInfo_(
			nil,
			nil,
			['moneywell'],
			@main_window,
			self,
			'openPanelDidEnd:returnCode:contextInfo:',
			nil
		)
			
	end
	
	def openPanelDidEnd_returnCode_contextInfo(panel, return_code, context_info)
		return if return_code == OSX::NSCancelButton
		
		OSX::NSLog 'Open a file!'
		@budget = Budget.new(panel.filenames.first)
		@budget.buckets
	end
		
end