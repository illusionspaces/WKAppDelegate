

Pod::Spec.new do |spec|



  spec.name         = "WKAppDelegate"
  spec.version      = "0.0.6"
  spec.summary      = "一个对APPDelegate深度解耦的逻辑."

 

  spec.homepage     = "https://github.com/GitWangKai/WKAppDelegate"


  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "王凯" => "18500052382@163.com" }

  spec.platform     = :ios, "6.0"


  spec.source       = { :git => "https://github.com/GitWangKai/WKAppDelegate.git", :tag => "#{spec.version}" }


  spec.source_files  = "WKAppDelegate/**/*.{h,m}"



end
