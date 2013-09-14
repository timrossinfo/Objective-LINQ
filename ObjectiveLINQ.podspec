Pod::Spec.new do |s|
  s.name     = 'Objective-LINQ'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'An implementation of Language Integrated Query (LINQ) for Objective-C.'
  s.homepage = 'https://github.com/timrossinfo/Objective-LINQ'
  s.author   = { 'Tim Ross' => 'tim@timross.info' }

  s.source   = { :git => 'https://github.com/timrossinfo/Objective-LINQ.git', :tag => 'v0.0.1' }

  s.description = %{
    Objective-LINQ makes it easy to perform query operations on NSArray objects.
  }

  s.source_files = 'ObjectiveLINQ/*.{h,m}'

  s.ios.frameworks = 'Foundation', 'UIKit'

  s.ios.deployment_target = '5.0'
  s.requires_arc = true
end
