Pod::Spec.new do |s|
  s.name = 'KeyboardConstraint'
  s.version = '0.0.3'
  s.license = 'MIT'
  s.summary = 'A NSLayoutConstraint subclass which observes keyboard notifications.'
  s.homepage = 'https://github.com/Papercloud/KeyboardConstraint/'
  s.authors  = { 'Mark Turner' => 'mt@papercloud.com.au' }
  s.source = { :git => 'https://github.com/Papercloud/KeyboardConstraint.git', :tag => s.version.to_s }
  s.source_files  = 'KeyboardConstraint/*.{h,m}'
  s.requires_arc = true
  s.ios.deployment_target = '7.1'
end