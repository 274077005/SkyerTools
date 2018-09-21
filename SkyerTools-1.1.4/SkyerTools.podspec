Pod::Spec.new do |s|
  s.name = "SkyerTools"
  s.version = "1.1.4"
  s.summary = "Write their own library, or to use at ordinary times convenient methods are kept in it after use"
  s.license = "MIT"
  s.authors = {"274077005@qq.com"=>"skyer"}
  s.homepage = "https://github.com/274077005"
  s.requires_arc = true
  s.source = { :path => '.' }

  s.ios.deployment_target    = '9.0'
  s.ios.vendored_framework   = 'ios/SkyerTools.framework'
end
