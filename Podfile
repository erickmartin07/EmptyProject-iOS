source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'
use_frameworks!

inhibit_all_warnings!

def sharedPods
    pod 'Swinject', '2.5.0'
    pod 'SwinjectStoryboard', '2.0.2'
    pod 'RxSwift', '4.3.1'
    pod 'RxCocoa', '4.3.1'
    pod 'RxBlocking', '4.3.1'
    pod 'RxAlamofire', '4.2.0'
    pod 'ObjectMapper', '3.3.0'
    pod 'Kingfisher', '4.10.0'
    pod 'SwiftDate', '5.0.9'
    pod 'KRProgressHUD', '3.3.0'
    pod 'SwiftValidator', :git => 'https://github.com/jpotts18/SwiftValidator.git', :branch => 'master'
    pod 'RealmSwift', '3.10.0'
    pod 'IQKeyboardManagerSwift', '6.1.1'
end

target 'EmptyProject' do
    sharedPods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_BITCODE'] = 'NO'
            config.build_settings['SWIFT_VERSION'] = '4.2'
            if target.name == 'Swinject' || target.name == 'SwinjectStoryboard'
                config.build_settings['SWIFT_VERSION'] = '3.0'
            end
        end
    end
end
