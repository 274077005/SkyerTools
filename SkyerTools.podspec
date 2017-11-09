Pod::Spec.new do |spec|
spec.name             = "SkyerTools"                         #Pod的名字
spec.version          = "1.0.0"                                     #版本号
spec.summary          = "A example pod for SkyerTools"
spec.description      = <<-DESC                                     #Pod的描述
- A example pod for SkyerTool
DESC

spec.homepage         = "https://github.com/274077005/"   #Pod的地址

spec.license          = { :type => "BSD", :file => "LICENSE" }          #License
spec.author           = { "skyer" => "274077005@qq.com" }   #作者
spec.social_media_url = "http://weibo.com/"                   #weibo
spec.platform         = :ios, "8.0"                                     #平台、版本
spec.source           = { :git => "https://github.com/274077005/SkyerTools.git", :tag => spec.version.to_s }  #代码的git地址以及tag
spec.source_files     = "SkyerProject/SkyerTools/**/*.{h,m}"        #本地验证这里填  "**/*"  表示当前目录以及子目录的所有文件   如果发布到MonkeyPodSpec需要填写git clone下来的对应的路径
#进行子目录分层
spec.subspec 'UIButton' do |button|
    button.source_files = 'SkyerProject/SkyerTools/UIButton/**/*'
    button.public_header_files = 'SkyerProject/SkyerTools/UIButton/**/*.h'
end


spec.public_header_files = "SkyerProject/**/*.h"        #需要对外导出的头文件  此处为本地验证
spec.frameworks   = 'UIKit','AVFoundation'
spec.requires_arc     = true                                       #ARC
spec.pod_target_xcconfig = { "ONLY_ACTIVE_ARCH" => "No" }          #这个必须有，不要修改
end
