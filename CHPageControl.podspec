Pod::Spec.new do |s|
    s.name         = "CHPageControl"
    s.version      = "0.0.1"
    s.summary      = "You can Use CHPageControl to change CHPageControl's interval. and a easy way to change pageContorl's propertys"
    s.homepage     = "https://github.com/MeteoriteMan/CHPageControl"
    s.license      = "MIT"
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author       = { "张晨晖" => "shdows007@gmail.com" }
    s.platform     = :ios
    s.source       = { :git => "https://github.com/MeteoriteMan/CHPageControl.git", :tag => s.version }
    s.source_files = "CHPageControl/*.{h,m}"
    s.frameworks   = 'Foundation', 'UIKit'
end

