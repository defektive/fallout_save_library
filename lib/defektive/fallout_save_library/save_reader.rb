module Defektive
  module FalloutSaveLibrary
    class SaveReader

      attr_reader :save_file
      def initialize(file_name)
        @file_io = File.open(file_name, 'rb')
        @save_file = SaveFile.read @file_io
      end

      def screenshot
        @screenshot ||= (
          width = @save_file.screenshot_width
          height = @save_file.screenshot_height
          png = ChunkyPNG::Image.new(width, height)
          io = StringIO.new @save_file.screenshot
          row = -1
          until (row += 1) >= height do
            column = -1
            until (column += 1) >= width do
              r = io.readbyte
              g = io.readbyte
              b = io.readbyte
              a = io.readbyte
              png[column, row] = ChunkyPNG::Color.rgba(r, g, b, a)
            end
          end
          png.to_datastream
        )
      end
    end
  end
end
