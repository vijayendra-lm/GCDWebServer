
Pod::Spec.new do |s|
  s.name     = 'GCDWebServer'
  s.version  = '3.5.4'
  s.author   =  { 'Pierre-Olivier Latour' => 'info@pol-online.net' }
  s.license  = { :type => 'BSD', :file => 'LICENSE' }
  s.homepage = 'https://github.com/swisspol/GCDWebServer'
  s.summary  = 'Lightweight GCD based HTTP server for OS X & iOS (includes web based uploader & WebDAV server). This is a fork of https://github.com/swisspol/GCDWebServer.'
  
  s.source   = { :git => 'https://github.com/vijayendra-lm/GCDWebServer.git', :tag => s.version.to_s }
  s.ios.deployment_target = '12.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.7'
  s.requires_arc = true
  s.resource_bundles = {'GCDWebServer' => ['*.xcprivacy']}
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |cs|
    cs.source_files = 'GCDWebServer/**/*.{h,m}'
    cs.private_header_files = "GCDWebServer/Core/GCDWebServerPrivate.h"
    cs.requires_arc = true
    cs.ios.library = 'z'
    cs.ios.frameworks = 'CoreServices', 'CFNetwork'
    cs.tvos.library = 'z'
    cs.tvos.frameworks = 'CoreServices', 'CFNetwork'
    cs.osx.library = 'z'
    cs.osx.framework = 'SystemConfiguration'
  end
  
  s.subspec 'WebDAV' do |cs|
    cs.dependency 'GCDWebServer/Core'
    cs.source_files = 'GCDWebDAVServer/*.{h,m}'
    cs.requires_arc = true
    cs.ios.library = 'xml2'
    cs.tvos.library = 'xml2'
    cs.osx.library = 'xml2'
    cs.compiler_flags = '-I$(SDKROOT)/usr/include/libxml2'
  end
  
  s.subspec 'WebUploader' do |cs|
    cs.dependency 'GCDWebServer/Core'
    cs.source_files = 'GCDWebUploader/*.{h,m}'
    cs.requires_arc = true
    cs.resource = "GCDWebUploader/GCDWebUploader.bundle"
  end 
end
