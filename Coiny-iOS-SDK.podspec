Pod::Spec.new do |s|

  s.name             = "CoinySDK"
  s.version          = "0.0.2"
  s.summary          = "Integrate cryptocurrencies into your iOS application."
  s.description      = <<-DESC
                       Integrate cryptocurrencies into your iOS application with Coiny's fully featured bitcoin payments API. Coiny will allow you to buy/sell cryptocurrencies over your application. For more information https://coiny.io
                       DESC

  s.homepage         = "https://github.com/coinyio/coiny-ios-sdk"
  s.license          = 'MIT'
  s.author             = { "Kemal Kocabiyik" => "kemal@coiny.io" }
  s.platform     = :ios, "7.0"
  s.source           = { :git => "https://github.com/coinyio/coiny-ios-sdk.git", :tag => s.version.to_s }
  s.swift_version = "4.2"
  s.source_files  = "CoinySDK/CoinySDK/**/*.{h,m,swift}"
  s.exclude_files = "Classes/Exclude"
  s.social_media_url = 'https://twitter.com/coinyio'

end
