Pod::Spec.new do |spec|
spec.name             = "SkyerTools"                                    #Pod的名字
spec.version          = "1.0.8"                                         #版本号
spec.summary          = "A example pod for SkyerTools"
spec.description      = <<-DESC                                         #Pod的描述
- A example pod for SkyerTool
DESC

spec.homepage         = "https://github.com/274077005/"                 #Pod的地址
spec.requires_arc     = true                                            #ARC
spec.license          = { :type => "BSD", :file => "LICENSE" }          #License
spec.author           = { "skyer" => "274077005@qq.com" }               #作者
spec.social_media_url = "http://weibo.com/"                             #weibo
spec.platform         = :ios, "9.0"                                     #平台、版本
spec.source           = { :git => "https://github.com/274077005/SkyerTools.git", :tag => spec.version.to_s }  #代码的git地址以及tag
spec.source_files     = "SkyerProject/SkyerTools/**/*"                  #本地验证这里填  "**/*"  表示当前目录以及子目录的所有文件   如果发布到MonkeyPodSpec需要填写git clone下来的对应的路径

#spec.public_header_files = "SkyerProject/SkyerTools/*.*"      #需要对外导出的头文件  此处为本地验证

#进行子目录分层
#spec.subspec 'UIButton' do |ss|
#    ss.source_files = 'SkyerProject/SkyerTools/UIButton/UIButton+ClickBlock.{h,m}'
#    ss.public_header_files = 'SkyerProject/SkyerTools/UIButton/UIButton+ClickBlock.h'
#end


spec.frameworks   = 'UIKit','AVFoundation'

spec.ios.dependency 'MBProgressHUD'

#自己的或者第三方framework,比qqSDK的TencentOpenAPI.framework
#spec.vendored_frameworks = 'MyFramework.framework','TheirFramework.framework'

spec.pod_target_xcconfig = { "ONLY_ACTIVE_ARCH" => "No" }               #这个必须有，不要修改
#文件描述详情请打开 http://www.jianshu.com/p/f841e248bc4f

end
