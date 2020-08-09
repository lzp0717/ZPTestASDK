#
# Be sure to run `pod lib lint ZPTestASDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZPTestASDK'
  s.version          = '0.1.1.Binary'
  s.summary          = 'A short description of ZPTestASDK.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/lzp0717/ZPTestASDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zp' => '379357324@qq.com' }
  s.source           = { :git => 'https://github.com/lzp0717/ZPTestASDK.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.dependency 'AFNetworking'
  
  if s.version.to_s.include?'Binary'
      s.prepare_command = <<-CMD
        cd ZPTestASDKBinaryBuild
        sh ZPTestASDKBinary.sh
      CMD
      s.ios.vendored_frameworks = 'ZPTestASDKBinaryBuild/Products/**/*.framework'
      s.resource = 'ZPTestASDKBinaryBuild/Products/**/*.bundle'
      else
      s.source_files = 'ZPTestASDK/Classes/**/*'
      s.resource = 'ZPTestASDK/Assets/*.bundle'
  end
end
