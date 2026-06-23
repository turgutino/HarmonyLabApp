@Component
export struct SimpleHelloCodeGenie {
  build() {
    Column() {
      Text('Hello CodeGenie')
        .fontSize(40)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Black)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}