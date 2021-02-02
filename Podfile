# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RxSample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RxSample
  pod 'RxSwift', '6.0.0'
  pod 'RxCocoa', '6.0.0'
  pod 'SwiftFormat/CLI'
  

  target 'RxSampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'RxSampleUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
    end
  end
end
