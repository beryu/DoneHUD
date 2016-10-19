Pod::Spec.new do |s|
  s.name = "DoneHUD"
  s.version = "1.0.0"
  s.summary = "Done animation on HUD made with Swift"
  s.homepage = "https://github.com/beryu/DoneHUD"
  s.screenshots = "https://github.com/beryu/DoneHUD/raw/master/DoneHUD_demo.gif"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Ryuta Kibe" => "beryu@blk.jp" }
  s.social_media_url   = "http://twitter.com/beryu"
  s.platform = :ios
  s.ios.deployment_target = "8.0"
  s.source = { :git => "https://github.com/beryu/DoneHUD.git", :tag => "1.0.0" }
  s.source_files = "Source/*"
  s.requires_arc = true
end

