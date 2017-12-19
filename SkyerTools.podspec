Pod::Spec.new do |spec|
spec.name     = 'SkyerProject'
spec.version  = '1.0.9'
spec.license  = 'MIT'
spec.summary  = 'A delightful iOS and OS X SkyerProject framework.'
spec.homepage = 'https://github.com/274077005'
spec.authors  = { '274077005@qq.com' => 'skyer' }
spec.source   = { :git => 'https://github.com/274077005/SkyerTools.git', :tag => spec.version, :submodules => true }
spec.requires_arc = true

spec.public_header_files = 'SkyerProject/SkyerTools/SkyerTools.h'
spec.source_files = 'SkyerProject/SkyerTools/SkyerTools.h'


spec.subspec 'skCategory' do |sk|
sk.source_files = 'SkyerProject/SkyerTools/skCategory/*.{h,m}'
sk.public_header_files = 'SkyerProject/SkyerTools/skCategory/CategoryHeader.h'
sk.frameworks = 'UIKit'
end

spec.subspec 'skTools' do |sk|
sk.source_files = 'SkyerProject/SkyerTools/skTools/*.{h,m}'
sk.public_header_files = 'SkyerProject/SkyerTools/skTools/*.h'
sk.dependency 'MBProgressHUD'
sk.frameworks = 'UIKit' ,'AVFoundation'
end

#文件描述详情请打开 http://www.jianshu.com/p/f841e248bc4f
#更新步骤
#git tag ‘1.0.0’
#git push --tags
#pod lib lint SkyerTools.podspec --use-libraries
#pod trunk push SkyerTools.podspec --use-libraries


end
