import webview from '@ohos.web.webview';
import router from '@ohos.router';

@Entry
@Component
struct RelicSystemWebPage {
  controller: webview.WebviewController = new webview.WebviewController();
  @State isLoading: boolean = true;
  // Host machine's LAN IP — the emulator cannot reach the host via "localhost".
  private siteUrl: string = 'http://10.4.29.60:3000';

  build() {
    Column() {
      Row() {
        Text('‹')
          .fontSize(26)
          .fontColor('#FFF8EC')
          .padding({ right: 12 })
          .onClick(() => router.back())
        Text('Relic System')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFF8EC')
      }
      .width('100%')
      .height(56)
      .padding({ left: 16 })
      .backgroundColor('#5B3A29')

      Stack() {
        Web({ src: this.siteUrl, controller: this.controller })
          .width('100%')
          .height('100%')
          .onPageBegin(() => {
            this.isLoading = true;
          })
          .onPageEnd(() => {
            this.isLoading = false;
          })

        if (this.isLoading) {
          Column() {
            LoadingProgress().width(48).height(48).color('#5B3A29')
            Text('Loading Relic System...')
              .fontSize(14)
              .fontColor('#5B3A29')
              .margin({ top: 8 })
          }
        }
      }
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}
