# qrcode_img

Generate QR code image

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  qrcode_img:
    github: Hentioe/qrcode_img.cr
    branch: master
```

`libqrencode` is required. On Debian-based systems, it can be installed via:

```` bash
sudo apt install libqrencode-dev
````

## Usage

```` crystal
require("qrcode_img")

qr = QRcodeImg::QRcode.new("大家好！")
qr.save("hello.png")
````

## Contributing

1. Fork it (<https://github.com/Hentioe/qrcode_img.cr>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Hentioe](https://github.com/Hentioe/qrcode_img.cr) - creator and maintainer
