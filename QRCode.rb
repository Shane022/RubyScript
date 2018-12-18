#!/usr/bin/ruby
# -*- coding: UTF-8 -*-
#coding=utf-8
require 'FileUtils'
require 'rqrcode'

versionCode = "3.0.1.3.3(4399)"

# str = versionCode.gsub(/\A\(+[.*]/, "")
str = versionCode.match(/[^\(]+/)

puts "--- #{str}"
puts "--- #{versionCode}"

# 获取当前文件夹名称
dirname = File.basename(Dir.getwd)
puts dirname

qrcode = RQRCode::QRCode.new("http://fir.im/1234")
png = qrcode.as_png(
		 resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 120,
          border_modules: 4,
          module_px_size: 6,
          file: nil # path to write
	)
IO.write("/Users/dvt04/Desktop/QR.png", png.to_s)

pic_exist = "false"
def getPicInfo
	pic_path = Dir::pwd
	arrFiles = `ls #{pic_path}`.split
	for i in arrFiles do
		if i.include?"QR.png"
			return "true"
		else
			return "false"
		end
	end
end

