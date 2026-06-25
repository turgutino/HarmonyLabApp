import router from '@ohos.router';
import { RELICS, Relic } from './RelicData';

interface RouteParams {
  id: string;
}

@Entry
@Component
struct RelicDetailPage {
  @State relic: Relic | null = null;

  aboutToAppear(): void {
    const params = router.getParams() as RouteParams;
    const id = params?.id ?? '';
    const found = RELICS.find((r: Relic) => r.id === id);
    this.relic = found ?? null;
  }

  build() {
    Column() {
      Row() {
        Text('‹')
          .fontSize(26)
          .fontColor('#FFF8EC')
          .padding({ right: 12 })
          .onClick(() => router.back())
        Text('Relic Detail')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFF8EC')
      }
      .width('100%')
      .height(64)
      .padding({ left: 16 })
      .backgroundColor('#5B3A29')

      if (this.relic) {
        Column() {
          Row() {
            Text(this.relic.dynasty)
              .fontSize(13)
              .fontColor('#5B3A29')
              .backgroundColor('#E6D2B0')
              .padding({ left: 10, right: 10, top: 4, bottom: 4 })
              .borderRadius(20)
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)
          .margin({ top: 18, bottom: 10 })

          Text(this.relic.name)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor('#3D2B1F')
            .margin({ bottom: 14 })

          Column() {
            Row() {
              Text('Museum').fontSize(13).fontColor('#8A7560').width(90)
              Text(this.relic.museum).fontSize(14).fontColor('#3D2B1F').layoutWeight(1)
            }.width('100%').margin({ bottom: 10 })

            Row() {
              Text('Material').fontSize(13).fontColor('#8A7560').width(90)
              Text(this.relic.material).fontSize(14).fontColor('#3D2B1F').layoutWeight(1)
            }.width('100%').margin({ bottom: 14 })
          }
          .width('100%')
          .padding(14)
          .backgroundColor('#FFFDF8')
          .borderRadius(12)
          .alignItems(HorizontalAlign.Start)

          Text(this.relic.description)
            .fontSize(15)
            .fontColor('#5B4636')
            .lineHeight(22)
            .margin({ top: 16 })
        }
        .width('100%')
        .padding(20)
        .alignItems(HorizontalAlign.Start)
      } else {
        Text('Relic not found')
          .fontSize(16)
          .fontColor('#8A7560')
          .margin({ top: 40 })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1E6D4')
  }
}
