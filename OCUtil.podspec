#
#  Be sure to run `pod spec lint LocalHubTest.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "OCUtil"
  s.version      = "0.0.9"
  s.summary      = "OC 工具类"

  s.description  = <<-DESC
                   包含一些常用到的扩展方法以及工具方法.
                   DESC
  s.homepage     = "https://github.com/a7510774/OCUtil.git"
  s.author       = { "chengw" => "260323117@qq.com" }
  s.license      = "MIT"
  s.platform     = :ios, "7.0"
  s.source       = {:git => "https://github.com/a7510774/OCUtil.git", :tag => s.version.to_s }
  s.source_files = 'OCUtil/*.{h,m}','OCUtil/NSObject', 'OCUtil/NSObject/*.{h,m}','OCUtil/UIButton', 'OCUtil/UIButton/*.{h,m}','OCUtil/UIImage', 'OCUtil/UIImage/*.{h,m}','OCUtil/UIImageView', 'OCUtil/UIImageView/*.{h,m}','OCUtil/ UITextField', 'OCUtil/ UITextField/*.{h,m}','OCUtil/UIView', 'OCUtil/UIView/*.{h,m}'
  s.frameworks = "UIKit", "Foundation"
  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
    s.requires_arc = true
  #  s.prefix_header_contents = '#import "OCUtil.h"'
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  #  s.dependency "JSONKit", "~> 1.4"
end
