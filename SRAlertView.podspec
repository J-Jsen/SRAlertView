
Pod::Spec.new do |s|
  s.name         = "SRAlertView"
  s.version      = "2.0.0"
  s.summary      = "A custom alert view which has animation while showing."
  s.description  = "A custom alert view which has animation while showing and blur the current background view."
  s.homepage     = "https://github.com/guowilling/SRAlertView"
  s.license      = "MIT"
  s.author       = { "guowilling" => "guowilling90@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/guowilling/SRAlertView.git", :tag => "#{s.version}" }
  s.source_files = "SRAlertView/*.{h,m}"
  s.requires_arc = true
  s.dependency 'FXBlurView'
end
