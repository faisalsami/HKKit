
Pod::Spec.new do |s|
  s.name             = "HKKit"
  s.version          = "2.8"
  s.summary          = "Perosnal repo"
  s.description      = "Faster app development use for my personal use only in order to import and maintain my gloabal funcations"

  s.homepage         = "https://github.com/hardikdevios/HKKit"
  s.license          = 'MIT'
  s.author           = { "Hardik" => "hardik@praxinfo.com" }
  s.source           = { :git => "https://github.com/hardikdevios/HKKit.git", :tag => s.version.to_s }

  s.platform     = :ios, '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  # s.resource_bundles = {
  #   'HKKit' => ['Pod/Assets/*.png']
  # }
  s.dependency 'Alamofire'
  s.dependency 'SwiftyJSON'
  s.dependency 'AlamofireImage'
  s.dependency 'MagicalRecord'
  s.dependency 'DZNEmptyDataSet'
  s.dependency 'Cartography'

end
