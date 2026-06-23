@Component
export struct HelloOnStart {
  @State greeting: string = '';

  aboutToAppear() {
    // This method is called when the component is about to appear
    // Set the greeting message when the app starts
    this.greeting = 'Hello CodeGenie';
    
    // Optional: You could also log to console or perform other initialization
    console.log('App started - displaying: Hello CodeGenie');
  }

  build() {
    Column() {
      Text(this.greeting)
        .fontSize(36)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Green)
        .margin({ bottom: 20 })

      Text('App started successfully!')
        .fontSize(18)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}