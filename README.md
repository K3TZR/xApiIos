### xApiIos [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://en.wikipedia.org/wiki/MIT_License)

#### API Explorer for Flex (TM) 6000 series radios (SwiftUI iOS version)

##### Built on:
*  macOS 11.2.3
*  Xcode 12.4 (12D4e) 
*  Swift 5.3 / SwiftUI

##### Runs on:
* iOS 14 and higher

##### Builds
Since this is an iOS / iPad app, no builds are included in releases. Until it is on the App Store (some day) you will only be able to run it in Xcode on a simulator or an attached device.

##### Comments / Questions
Please send any bugs / comments / questions to support@k3tzr.net

##### Credits
[CocoaAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket)

[xLib6000](https://github.com/K3TZR/xLib6000.git)

[xClient](https://github.com/K3TZR/xClient.git)

[SwiftyUserDefaults](https://github.com/sunshinejr/SwiftyUserDefaults.git)

[XCGLogger](https://github.com/DaveWoodCom/XCGLogger.git)

[JWTDecode](https://github.com/auth0/JWTDecode.swift.git)

##### Other software
[![xSDR6000](https://img.shields.io/badge/K3TZR-xSDR6000-informational)]( https://github.com/K3TZR/xSDR6000) A SmartSDR-like client for the Mac.   
[![DL3LSM](https://img.shields.io/badge/DL3LSM-xDAX,_xCAT,_xKey-informational)](https://dl3lsm.blogspot.com) Mac versions of DAX and/or CAT and a Remote CW Keyer.  
[![W6OP](https://img.shields.io/badge/W6OP-xVoiceKeyer,_xCW-informational)](https://w6op.com) A Mac-based Voice Keyer and a CW Keyer.  

---
##### 1.2.5 Release Notes
* changed ContentView to be a TabView
* added ApiTesterView
* added MeterManager & MetersView
* refactored FilterView

##### 1.2.4 Release Notes
* renamed defaultConnection to defaultNonGuiConnection
* changed colors for object display
* removed unused code

##### 1.2.3 Release Notes
* changed UIImage / NSImage to SwiftUI Image
* changed UIColor / NSColor to SwiftUI Color
* removed unused properties and code

##### 1.2.0 Release Notes
* many small corrections
* added SwiftLint phase
* corrected swiftlint.yml
* eliminated trailing whitespaces
* bumped version to match xApiMac version

##### 1.0.1 Release Notes
* replaced xClientIos with xClient

##### 1.0.0 Release Notes
* initial release
* reworked to more closely resemble xApiMac

##### 0.9.7 Release Notes
* continuing development

##### 0.9.6 Release Notes
* restored the use of a RadioManagerDelegate
* corrected the functioning of sheets, specifically the PickerView

##### 0.9.5 Release Notes
* continuing development

##### 0.9.4 Release Notes
* continuing development

##### 0.9.3 Release Notes
* eliminated "Tester" used as appName
* added SubViews folder and moved items to it

##### 0.9.2 Release Notes
* corrections throughout

##### 0.9.1 Release Notes
* added README.md

##### 0.9.0 Release Notes
* initial commit
