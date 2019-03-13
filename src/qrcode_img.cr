require "qrencode"
require "stumpy_png"

include StumpyPNG

module QRcodeImg
  VERSION = "0.1.0"

  class QRcode
    setter input : String

    def initialize(@input)
    end

    private def build_canvas
      qr = QRencode::QRcode.new(@input)
      canvas = Canvas.new(qr.width, qr.width)

      row_i, col_i = 0, 0
      qr.each_row do |row|
        # each row is `width` bytes
        row.each do |byte|
          if QRencode::Util.black? byte
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
