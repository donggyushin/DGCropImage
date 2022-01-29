# DGCropImage
A photo cropping tool which mimics Photo.app written by Swift. <br/>
This library supports localized string for english and korean. If there is other languages whenever just let me know or feel free to open a new pull request. 
<div>
<img src="https://user-images.githubusercontent.com/34573243/151155873-e8ebe9ed-2d84-451d-a620-31c39c088827.gif" width=250 />
</div>

## Requirements
- iOS 12.0+
- Swift 5.5+
- Xcode 10.0+


## Installation

### SPM
```
File > Add Packages > https://github.com/donggyushin/DGCropImage
```

### CocoaPod
```
pod 'DGCropImage', :git => 'https://github.com/donggyushin/DGCropImage.git'
```

## Usage
```
let crop = DGCropImage.crop(image: image)
self.present(crop, animated: true, completion: nil)

// Don't forget
crop.delegate = self
```
