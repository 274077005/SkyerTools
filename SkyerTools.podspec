Pod::Spec.new do |spec|
spec.name             = "SkyerTools"                                    #Pod的名字
spec.version          = "1.0.5"                                         #版本号
spec.summary          = "A example pod for SkyerTools"
spec.description      = <<-DESC                                         #Pod的描述
- A example pod for SkyerTool
DESC

spec.homepage         = "https://github.com/274077005/"                 #Pod的地址
spec.requires_arc     = true                                            #ARC
spec.license          = { :type => "BSD", :file => "LICENSE" }          #License
spec.author           = { "skyer" => "274077005@qq.com" }               #作者
spec.social_media_url = "http://weibo.com/"                             #weibo
spec.platform         = :ios, "8.0"                                     #平台、版本
spec.source           = { :git => "https://github.com/274077005/SkyerTools.git", :tag => spec.version.to_s }  #代码的git地址以及tag
spec.source_files     = "SkyerProject/SkyerTools/SkyerTools.h"                  #本地验证这里填  "**/*"  表示当前目录以及子目录的所有文件   如果发布到MonkeyPodSpec需要填写git clone下来的对应的路径

#spec.public_header_files = "SkyerProject/SkyerTools/SkyerTools.h"      #需要对外导出的头文件  此处为本地验证

#进行子目录分层
spec.subspec 'UIButton' do |ss|
    ss.source_files = 'SkyerProject/SkyerTools/UIButton/UIButton+ClickBlock.{h,m}'
    ss.public_header_files = 'SkyerProject/SkyerTools/UIButton/UIButton+ClickBlock.h'
end



spec.frameworks   = 'UIKit','AVFoundation'

spec.pod_target_xcconfig = { "ONLY_ACTIVE_ARCH" => "No" }               #这个必须有，不要修改

end
