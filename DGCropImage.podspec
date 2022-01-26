Pod::Spec.new do |s|
    s.name             = 'DGCropImage'
    s.version          = '1.0.0'
    s.summary          = 'A photo cropping tool which mimics Photo.app written by Swift.'
    s.homepage         = 'https://github.com/donggyushin/DGCropImage'
    s.license          = { :type => 'MIT', :file => 'LICENSE.md' }
    s.author           = { 'donggyushin' => 'donggyu9410@gmail.com' }
    s.source           = { :git => 'https://github.com/donggyushin/DGCropImage.git', :tag => s.version.to_s }
    s.ios.deployment_target = '12.0'
    s.swift_version = '5.5'
    s.source_files = 'Sources/DGCropImage/**/*'
    s.resource_bundles = {
    "DGCropImageResources" => ["Sources/**/*.lproj/*.strings"]
    }
    s.pod_target_xcconfig = {
    "PRODUCT_BUNDLE_IDENTIFIER": "com.donggyushin.DGCropImage"
    }
  end