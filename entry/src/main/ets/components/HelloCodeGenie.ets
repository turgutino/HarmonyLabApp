@Component
export struct HelloCodeGenie {
  // State variable to hold the greeting message
  @State greeting: string = 'Hello CodeGenie';

  build() {
    Column() {
      // Display the greeting message
      Text(this.greeting)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)
        .margin({ top: 20 })

      // Optional: Add a description
      Text('Welcome to HarmonyOS Development!')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ top: 10 })

      // Optional: Add a button to change the message
      Button('Change Greeting')
        .width(200)
        .height(40)
        .margin({ top: 20 })
        .onClick(() => {
          this.greeting = 'Hello HarmonyOS!';
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}