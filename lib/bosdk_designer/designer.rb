require 'win32ole'

module BOSDK
  class Designer
    def initialize(username, password, cms, args = {})
      @designer = WIN32OLE.new('Designer.Application')
      @designer.Logon(
        username,
        password,
        cms,
        args[:authtype] || 'secEnterprise'
      )
      @designer.Visible = args[:visible] || false
      @designer.Interactive = args[:interactive] || false
    end

    def open_universe(universe_folder, universe_name, lock = false)
      @designer.Universes.OpenFromEnterprise(
        universe_folder, universe_name, lock
      )
    end

    def method_missing(method, *args)
      ole_method_name = method.to_s.sub(/=$/, '')
      if @designer.ole_respond_to?(ole_method_name)
        @designer.send(method, *args)
      else
        super
      end
    end
  end
end
