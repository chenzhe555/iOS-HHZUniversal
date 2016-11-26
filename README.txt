# iOS-HHZUniversal
基础工程

/**********************使用http网络类

1.创建一个HHZHTTPConfigPlist.plist，最外层是Dictionary,创建以下下参数:

<key>AF_BASE_HTTP_URL</key>
<string>http://meicai.cn</string>

2.创建一个HHZNavigationController.plist，最外层是Dictionary,创建以下下参数

<key>barTintColor</key>
<string>#DC143C</string>
<key>isBold</key>
<true/>
<key>textFontSize</key>
<integer>18</integer>
<key>textColor</key>
<string>#DC143C</string>

3.如果要支持HTTPS,则将证书命名为hhzHttpCertificate.cer
