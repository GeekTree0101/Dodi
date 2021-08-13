platform :ios, '14.0'

use_frameworks!
inhibit_all_warnings!


workspace 'Dodi'

def common_framework
  pod 'NeedleFoundation'
  pod 'Then'
end

def ui_framework
  pod 'Texture'
  pod 'BonMot'
  pod 'DeepDiff'
end

target 'DodiUI' do
  project 'Projects/DodiUI/DodiUI'
  common_framework
  ui_framework
end

target 'DodiCore' do
  project 'Projects/DodiCore/DodiCore'
  common_framework
end

target 'DodiRepository' do
  project 'Projects/DodiRepository/DodiRepository'
  common_framework
end

target 'DodiDetail' do
  project 'Projects/DodiDetail/DodiDetail'
  common_framework
end

target 'DodiList' do
  project 'Projects/DodiList/DodiList'
  common_framework
end

target 'Dodi' do
  project 'Projects/Dodi/Dodi'
  common_framework
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
    end
  end
end
