#
# Be sure to run `pod lib lint JSProgressView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JSProgressView'
  s.version          = '0.4.0'
  s.summary          = 'A short description of JSProgressView.'



  s.description      = <<-DESC
状态显示和进度条
                       DESC

  s.homepage         = 'https://github.com/lmg4819/JSProgressView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lmg4819' => 'luomengge@cheyipai.com' }
  s.source           = { :git => 'https://github.com/lmg4819/JSProgressView.git', :tag => s.version.to_s }


  s.ios.deployment_target = '9.0'

  s.source_files = 'JSProgressView/Classes/JSProgressView/**/*.{h,m}'

  s.dependency 'MBProgressHUD','~> 1.1.0'
  s.dependency 'SVProgressHUD','~> 2.2.5'
end
