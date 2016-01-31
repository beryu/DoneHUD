# DoneHUD
![Platform](https://cocoapod-badges.herokuapp.com/p/DoneHUD/badge.svg)
![License](https://img.shields.io/cocoapods/l/DoneHUD.svg?style=flat)
![Cocoapods](https://cocoapod-badges.herokuapp.com/v/DoneHUD/badge.svg)

Done animation on HUD made with Swift

![demo](DoneHUD_demo.gif)

## Installation

### CocoaPods

```
pod 'DoneHUD'
```

### Manually

Add the [DoneHUD.swift](https://github.com/beryu/DoneHUD/blob/master/Source/DoneHUD.swift) and [DoneView.swift](https://github.com/beryu/DoneHUD/blob/master/Source/DoneView.swift) file to your project.

## Usage
```
// Just show check animation
DoneHUD.showInView(self.view)
```

```
// Show check animation with message "Done"
DoneHUD.showInView(self.view, message: "Done")
```

## Requirements
* Swift2.0
* iOS 8.0
* ARC

If you want to use even iOS7.0, please to import the code directly.

## License
The MIT License (MIT)

Copyright (c) 2016 Ryuta Kibe (beryu@blk.jp)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.