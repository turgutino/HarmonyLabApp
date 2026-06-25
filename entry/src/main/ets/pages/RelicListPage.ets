import router from '@ohos.router';
import { RELICS, Relic } from './RelicData';

@Entry
@Component
struct RelicListPage {
  @State relics: Relic[] = RELICS;

  build() {
    Column() {
      Row() {
        Text('Overseas Relic Catalog')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFF8EC')
      }
      .width('100%')
      .height(64)
      .padding({ left: 20 })
      .backgroundColor('#5B3A29')

      List({ space: 10 }) {
        ForEach(this.relics, (relic: Relic) => {
          ListItem() {
            Row() {
              Column() {
                Text(relic.name)
                  .fontSize(17)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#3D2B1F')
                  .margin({ bottom: 4 })
                Text(`${relic.dynasty} · ${relic.museum}`)
                  .fontSize(13)
                  .fontColor('#8A7560')
                  .maxLines(1)
              }
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)

              Text('›')
                .fontSize(22)
                .fontColor('#C9A876')
            }
            .width('100%')
            .padding(14)
            .backgroundColor('#FFFDF8')
            .borderRadius(12)
            .onClick(() => {
              router.pushUrl({
                url: 'pages/RelicDetailPage',
                params: { id: relic.id }
              });
            })
          }
        }, (relic: Relic) => relic.id)
      }
      .width('100%')
      .layoutWeight(1)
      .padding({ left: 14, right: 14, top: 12 })
      .backgroundColor('#F1E6D4')
    }
    .width('100%')
    .height('100%')
  }
}
