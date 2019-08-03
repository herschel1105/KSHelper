

Pod::Spec.new do |s|
s.name             = 'KSHelper'
s.version          = '1.0.5'
s.summary          = 'KSHelper is a simple framework.'

s.description      = <<-DESC
'KSHelper is a simple framework which will help you work with simple things but easier.
DESC

s.homepage         = 'https://github.com/herschel1105/KSHelper'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'herschel1105' => 'keigo.s1105@icloud.com' }
s.source           = { :git => 'https://github.com/herschel1105/KSHelper.git', :tag => s.version.to_s }

s.ios.deployment_target = '12.0'

s.source_files = 'Source/**/*.swift'
s.swift_version = '5.0'
s.platforms = {
  "ios": "12.0"
}

end
