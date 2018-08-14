source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'
use_frameworks!

inhibit_all_warnings!

def sharedPods
    pod 'Swinject', '2.0.0'
    pod 'SwinjectStoryboard', '1.0.0'
    pod 'RxSwift', '3.0.1'
    pod 'RxCocoa', '3.0.1'
    pod 'RxBlocking', '3.0.1'
    pod 'RxAlamofire', '3.0.2'
    pod 'ObjectMapper', '2.2.1'
    pod 'Kingfisher'
    pod 'KRProgressHUD', '2.1.0'
    pod 'SwiftValidator', :git => 'https://github.com/jpotts18/SwiftValidator.git', :branch => 'swift-3'
    pod 'RealmSwift', '3.0.1'
    pod 'IQKeyboardManagerSwift', '5.0.2'
end

target 'EmptyProject' do
    sharedPods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
            config.build_settings['ENABLE_BITCODE'] = 'NO'
        end
    end
end
