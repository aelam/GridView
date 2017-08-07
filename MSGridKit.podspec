Pod::Spec.new do |s|
  s.name             = 'MSGridKit'
  s.version          = '0.1.0'
  s.summary          = 'MSGridKit simple Grid View'


  s.description      = <<-DESC
    iOS GridView displays Stock Grid
DESC

  s.homepage         = 'https://github.com/aelam/MSGridKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aelam' => 'wanglun02@gmail.com' }
  s.source           = { :git => 'https://github.com/aelam/MSGridKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MSGridKit/Classes/**/*'
  s.dependency 'CSStickyHeaderFlowLayout'

end
