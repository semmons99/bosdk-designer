require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module BOSDK
  describe Designer do
    before(:each) do
      @application = mock('Designer.Application')

      WIN32OLE.should_receive(:new).at_least(1).with('Designer.Application').and_return(@application)
      @application.should_receive(:Logon).at_least(1).with('Administrator', '', 'cms', 'secEnterprise')
      @application.should_receive(:Visible=).at_least(1).with(false)
      @application.should_receive(:Interactive=).at_least(1).with(false)

      @designer = Designer.new('Administrator', '', 'cms')
    end

    describe '#new' do
      it 'should accept an optional authtype' do
        @application.should_receive(:Logon).once.with('Administrator', '', 'cms', 'secWinAD')

        Designer.new('Administrator', '', 'cms', :authtype => 'secWinAD')
      end

      it 'should accept an optional visible' do
        @application.should_receive(:Visible=).once.with(true)

        Designer.new('Administrator', '', 'cms', :visible => true)
      end

      it 'should accept an optional interactive' do
        @application.should_receive(:Interactive=).once.with(true)

        Designer.new('Administrator', '', 'cms', :interactive => true)
      end
    end

    describe '#open_universe' do
      before(:each) do
        @universes = mock('Designer.Universes')
        @application.should_receive(:Universes).once.with.and_return(@universes)
      end

      it 'should open a universe' do
        @universes.should_receive(:OpenFromEnterprise).once.with('/', 'eFashion', false)

        @designer.open_universe('/', 'eFashion')
      end

      it 'should optionally lock the opened universe' do
        @universes.should_receive(:OpenFromEnterprise).once.with('/', 'eFashion', true)

        @designer.open_universe('/', 'eFashion', true)
      end
    end

    describe '#method_missing' do
      it 'should check if the underlying designer responds to the method' do
        @application.should_receive(:ole_respond_to?).once.with('Visible').and_return(true)
        @application.should_receive(:Visible=).once.with(true)

        @designer.Visible = true
      end
    end
  end
end
