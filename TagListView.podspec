Pod::Spec.new do |s|
  s.name         = "TagListView"
  s.version      = "1.3.2"
  s.summary      = "A segment List View base on TagListView"
  s.homepage     = "https://github.com/ElaWorkshop/TagListView"
  s.license      = "MIT"
  s.author       = { "LIU Dongyuan" => "liu.dongyuan@gmail.com"  }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/xuwenquan/TagListView.git", :tag => s.version }
  s.source_files = "TagListView/*.swift"
  s.requires_arc = true
  s.swift_version = "4.2"
end
