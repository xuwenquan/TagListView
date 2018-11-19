Pod::Spec.new do |s|
  s.name         = "QBZ-TagListView"
  s.version      = "1.3.3"
  s.summary      = "A segment List View base on TagListView"
  s.homepage     = "https://github.com/xuwenquan/TagListView"
  s.license      = "MIT"
  s.author       = { "xuwenquan" => "xuwenquan.id@gmail.com"  }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xuwenquan/TagListView.git", :tag => s.version }
  s.source_files = "TagListView/*.swift"
  s.swift_version = "4.2"
end
