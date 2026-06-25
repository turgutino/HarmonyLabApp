import router from '@ohos.router';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Text('Hello, Turgut!')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor('#3D2B1F')
        .margin({ bottom: 28 })

      Button('Open Relic Catalog')
        .fontSize(16)
        .backgroundColor('#5B3A29')
        .fontColor('#FFF8EC')
        .borderRadius(24)
        .padding({ left: 24, right: 24, top: 12, bottom: 12 })
        .margin({ bottom: 14 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/RelicListPage' });
        })

      Button('Open Relic System (Live)')
        .fontSize(16)
        .backgroundColor('#3B6D11')
        .fontColor('#FFF8EC')
        .borderRadius(24)
        .padding({ left: 24, right: 24, top: 12, bottom: 12 })
        .onClick(() => {
          router.pushUrl({ url: 'pages/RelicSystemWebPage' });
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#F1E6D4')
  }
}
