require "qrencode"
require "stumpy_png"

include StumpyPNG

module QRcodeImg
  VERSION = "0.1.1"

  class QRcode
    setter input : String
    setter meta_table : Array(Array(Bool))
    setter size : Int32

    def initialize(@input, @zoom_level = 1)
      @meta_table = Array(Array(Bool)).new
      qr = QRencode::QRcode.new(@input, micro = true)
      @size = qr.width * @zoom_level
      qr.each_row do |row|
        meta_row = Array(Bool).new
        row.each do |byte|
          if QRencode::Util.black? byte
            @zoom_level.times do
              meta_row << true
            end
          else
            @zoom_level.times do
              meta_row << false
            end
          end
        end
        @zoom_level.times do
          @meta_table << meta_row
        end
      end
    end

    private def build_canvas
      canvas = Canvas.new(@size, @size)

      row_i, col_i = 0, 0
      @meta_table.each do |row|
        row.each do |meta|
          if meta
            color = RGBA.from_rgb_n(0, 0, 0, 8)
            canvas[row_i, col_i] = color
          else
            color = RGBA.from_rgb_n(255, 255, 255, 8)
            canvas[row_i, col_i] = color
          end
          col_i += 1
        end
        row_i += 1
        col_i = 0
      end
      canvas
    end

    def save(path)
      StumpyPNG.write(build_canvas, path)
    end
  end
end
