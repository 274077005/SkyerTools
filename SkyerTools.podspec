Pod::Spec.new do |spec|
spec.name     = 'SkyerTools'
spec.version  = '1.1.2'
spec.license  = 'MIT'
spec.summary  = 'Write their own library, or to use at ordinary times convenient methods are kept in it after use'
spec.homepage = 'https://github.com/274077005'
spec.authors  = { '274077005@qq.com' => 'skyer' }
spec.ios.deployment_target = '9.0'
spec.source   = { :git => 'https://github.com/274077005/SkyerTools.git', :tag => spec.version, :submodules => true }
spec.requires_arc = true


spec.subspec 'skCategory' do |sk|
sk.source_files = 'SkyerProject/SkyerTools/skCategory/*.{h,m}'
sk.public_header_files = 'SkyerProject/SkyerTools/skCategory/*.h'
sk.frameworks = 'UIKit'
end

spec.subspec 'skTools' do |sk|
sk.source_files = 'SkyerProject/SkyerTools/skTools/*.{h,m}'
sk.public_header_files = 'SkyerProject/SkyerTools/skTools/*.h'
sk.dependency 'MBProgressHUD'
sk.frameworks = 'UIKit' ,'AVFoundation','CoreLocation'
end

#文件描述详情请打开 http://www.jianshu.com/p/f841e248bc4f
#更新步骤
#git tag ‘1.0.0’
#git push --tags
#pod lib lint SkyerTools.podspec --use-libraries
#pod trunk push SkyerTools.podspec --use-libraries


end
