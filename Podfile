# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'LottoreCommend' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'Alamofire', '~> 4.9.1'
  pod 'Alamofire-Synchronous', '~> 4.0'
  pod 'SwiftyJSON', '~> 4.0'
  pod 'RealmSwift', '~>10'
  
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Action'
  pod 'NSObject+Rx'
  pod 'RxDataSources'
  pod 'RxCoreData'
  pod 'lottie-ios'

  pod 'Charts'
end
post_install do |installer_representation|
    installer_representation.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
            config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        end
    end
end
