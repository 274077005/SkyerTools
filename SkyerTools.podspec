Pod::Spec.new do |spec|
spec.name             = "SkyerTools"                                    #Pod的名字
spec.version          = "1.0.9"                                         #版本号
spec.summary          = "A example pod for SkyerTools"

spec.description = <<-DESC
A example pod for SkyerToolsA example pod for SkyerToolsA example pod for SkyerTools
DESC

spec.homepage         = "https://github.com/274077005/"                 #Pod的地址
spec.requires_arc     = true                                            #ARC
spec.license          = { :type => "BSD", :file => "LICENSE" }          #License
spec.author           = { "skyer" => "274077005@qq.com" }               #作者
spec.social_media_url = "http://weibo.com/"                             #weibo
spec.platform         = :ios, "9.0"                                     #平台、版本
spec.source           = { :git => "https://github.com/274077005/SkyerTools.git", :tag => spec.version.to_s }  #代码的git地址以及tag

spec.source_files     = "SkyerProject/SkyerTools/**/*"                  #本地验证这里填  "**/*"  表示当前目录以及子目录的所有文件

#spec.public_header_files = "SkyerProject/SkyerTools/*.*"               #需要对外导出的头文件  此处为本地验证

spec.frameworks   = 'UIKit','AVFoundation'
spec.ios.dependency 'MBProgressHUD'
spec.pod_target_xcconfig = { "ONLY_ACTIVE_ARCH" => "No" }               #这个必须有，不要修改

#进行子目录分层
spec.subspec 'Category' do |ls|
ls.source_files = 'SkyerProject/SkyerTools/Category/*.{h,m}'
ls.public_header_files = 'SkyerProject/SkyerTools/Category/*.h'
ls.frameworks = 'UIKit'  #这玩意是需要的系统库

#ls.dependency 'MBProgressHUD'      #这玩意是需要的第三方库
#ls.resource = 'iOS_Util/Location/chinaDivision.sqlite' #这玩意是需要的资源文件
end

#自己的或者第三方framework,比qqSDK的TencentOpenAPI.framework
#spec.vendored_frameworks = 'MyFramework.framework','TheirFramework.framework'
#文件描述详情请打开 http://www.jianshu.com/p/f841e248bc4f
#更新步骤
#git tag ‘1.0.0’
#git push --tags
#pod lib lint SkyerTools.podspec --use-libraries
#pod trunk push SkyerTools.podspec --use-libraries


end
