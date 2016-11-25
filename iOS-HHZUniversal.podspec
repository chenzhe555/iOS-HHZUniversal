#
#  Be sure to run `pod spec lint iOS-HHZUniversal.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "iOS-HHZUniversal"
  s.version      = "0.0.2"
  s.summary      = "iOS基础工程"
  s.requires_arc = true

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = "陈哲是个好孩子!"

  s.homepage     = "https://github.com/chenzhe555/iOS-HHZUniversal"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license = { :type => "MIT", :file => "LICENSE" }
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  s.author             = { "陈哲" => "376811578@qq.com" }
  # Or just: s.author    = "陈哲"
  # s.authors            = { "陈哲" => "376811578@qq.com" }
  # s.social_media_url   = "http://twitter.com/陈哲"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  s.platform     = :ios, "7.0"
  # s.platform     = :ios, "5.0"

  #  When using multiple platforms
  # s.ios.deployment_target = "5.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"
  s.ios.deployment_target = '7.0'


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/chenzhe555/iOS-HHZUniversal.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  
  s.source_files = 'iOS-HHZUniversal/classes/config/*.h'

  s.subspec 'iOS-HHZUniversal' do |one|
    one.subspec 'category' do |two|
      two.subspec 'foundation' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/category/foundation/*.{h,m}'
      end

      two.subspec 'uikit' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/category/uikit/*.{h,m}'
      end

      two.subspec 'others' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/category/others/*.{h,m}'
      end
    end

    one.subspec 'utils' do |two|
      two.subspec 'http' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/http/*.{h,m}'
      end

      two.subspec 'file' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/file/*.{h,m}'
      end

      two.subspec 'application' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/application/*.{h,m}'
      end

      two.subspec 'json' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/json/*.{h,m}'
      end

      two.subspec 'kit' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/kit/*.{h,m}'
      end

      two.subspec 'device' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/device/*.{h,m}'
      end

      two.subspec 'encryption' do |three|
        three.subspec 'GTMBase64' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/utils/encryption/GTMBase64/*.{h,m}'
        end
        three.source_files = 'iOS-HHZUniversal/classes/utils/encryption/*.{h,m}'
      end

      two.subspec 'cache' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/cache/*.{h,m}'
      end

      two.subspec 'plist' do |three|
        three.dependency 'iOS-HHZUniversal/iOS-HHZUniversal/utils/cache'
        
        three.source_files = 'iOS-HHZUniversal/classes/utils/plist/*.{h,m}'
      end

      two.subspec 'regular' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/regular/*.{h,m}'
      end

      two.subspec 'date' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/date/*.{h,m}'
      end

      two.subspec 'calculate' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/calculate/*.{h,m}'
      end

      two.subspec 'IQKeyboardManager' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/IQKeyboardManager/*.{h,m}'
      end

      two.subspec 'archive' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/utils/archive/*.{h,m}'
      end
    end

    one.subspec 'base' do |two|
      two.dependency 'iOS-HHZUniversal/iOS-HHZUniversal/utils'
      two.dependency 'iOS-HHZUniversal/iOS-HHZUniversal/category'

      two.source_files = 'iOS-HHZUniversal/classes/base/*.{h,m}'
    end



    one.subspec 'customView' do |two|
      two.subspec 'system' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/customView/system/*.{h,m}'
      end

      two.subspec 'custom' do |three|
        three.subspec 'Albums' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/Albums/*.{h,m}'
        end

        three.subspec 'BlurMenu' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/BlurMenu/*.{h,m}'
        end

        three.subspec 'BottomPopView' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/BottomPopView/*.{h,m}'
        end

        three.subspec 'launchView' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/launchView/*.{h,m}'
        end

        three.subspec 'LoadingView' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/LoadingView/*.{h,m}'
        end

        three.subspec 'NavigationView' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/NavigationView/*.{h,m}'
        end

        three.subspec 'NoneDataView' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/NoneDataView/*.{h,m}'
        end

        three.subspec 'QRCode' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/QRCode/*.{h,m}'
        end

        three.subspec 'RedPointView' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/RedPointView/*.{h,m}'
        end

        three.subspec 'SlipScrollView' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/SlipScrollView/*.{h,m}'
        end

        three.subspec 'Tabbar' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/Tabbar/*.{h,m}'
        end

        three.subspec 'UpdateAlertView' do |four|
          four.source_files = 'iOS-HHZUniversal/classes/customView/custom/UpdateAlertView/*.{h,m}'
        end
      end
    end




    one.subspec 'exception' do |two|
      two.source_files = 'iOS-HHZUniversal/classes/exception/*.{h,m}'
    end

    one.subspec 'http' do |two|
      two.dependency 'iOS-HHZUniversal/iOS-HHZUniversal/utils'
      two.dependency 'iOS-HHZUniversal/iOS-HHZUniversal/exception'

      two.source_files = 'iOS-HHZUniversal/classes/http/*.{h,m}'
    end

    one.subspec 'demo' do |two|
      two.dependency 'iOS-HHZUniversal/iOS-HHZUniversal/http'

      two.source_files = 'iOS-HHZUniversal/classes/demo/*.{h,m}'
    end

    one.subspec 'subclass' do |two|
      two.source_files = 'iOS-HHZUniversal/classes/subclass/*.{h,m}'
    end

    one.subspec 'customView' do |two|
      two.subspec 'system' do |three|
        three.source_files = 'iOS-HHZUniversal/classes/customView/system/*.{h,m}'
      end
    end

    one.subspec 'reference' do |two|
      two.source_files = 'iOS-HHZUniversal/classes/reference/*.{h,m}'
    end
    
  end


  #s.source_files  = "Classes", "Classes/**/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  s.frameworks = "UIKit", "Foundation"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"


  s.dependency "AFNetworking", "~> 3.1.0"
  s.dependency "PINCache", "3.0.1-beta"
  #s.dependency "IQKeyboardManager", "~> 4.0.6"
  #s.dependency "CocoaLumberjack", "~> 3.0.0"
  #s.dependency "SimpleKeychain", "~> 0.7.0"
  s.dependency "ZYQAssetPickerController", "~> 1.0.0"
  s.dependency "SDWebImage", "~> 4.0.0-beta2"
end
