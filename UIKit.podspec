Pod::Spec.new do |s|
  s.name         = “UIKit"
  s.version      = “0.0.1”
  s.summary      = "This framework is the point of UIKIt control based on the basic grammar"
  s.homepage     = "https://github.com/986138497/UIKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { “左兆磊” => “986138497” }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/986138497/UIKit.git", :tag => s.version.to_s }
  s.source_files  = "UIKit", "UIKit/**/*.{h,m}"
  s.public_header_files = "UIKit/**/*.h"
  s.requires_arc = true
end
