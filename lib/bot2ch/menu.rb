module Bot2ch
  class Menu
    BBS_MENU = 'http://menu.2ch.net/bbsmenu.html'

    class << self
      attr_reader :response

      def menu
        @menu ||= reload
      end
      alias boards menu

      def reload
        @response = Client.get(BBS_MENU)
        Bot2ch::Helper.make_array_of_response(Bot2ch::Menu.response).map do |line|
          Board.new($1, $2) if line =~ /<A\sHREF=([^>\s]+)>(.+)<\/A>/
        end.compact
      end

      def get_board(subdir)
        menu.each do |board|
          return board if ![board.directory, board.name].grep(subdir).empty?
        end
        raise ArgumentError
      end

      def get_boards(subdir)
        menu.select do |board|
          ![board.directory, board.name].grep(subdir).empty?
        end
      end
    end
  end
end
