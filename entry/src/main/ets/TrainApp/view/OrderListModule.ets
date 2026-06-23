/*
* Copyright (c) 2024 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { LoadingStatus } from '../common/CommonEnums';
import { LoadingFailedView } from '../view/LoadingFailedView';
import { BreakpointConstants } from '../common/BreakpointConstants';
import { BreakpointType } from '../util/BreakpointType';
import LazyDataSource from '../util/LazyDataSource';
import { CommonConstants } from '../common/CommonConstants';
import {
  Data, DataSource
} from '../viewmodel/OrderListModuleData';

@Component
export struct OrderListModule {
  @State itemModel: Data =
    Data.getInstance();
  @Prop listDirection: Axis = Axis.Vertical
  @State moduleTitle: string = "旅游票务订单列表";
  @State moduleRedirectContent: string = "查看更多订单";
  @State loadingStatus: LoadingStatus = LoadingStatus.OFF;
  @State lazyDataSource: LazyDataSource<DataSource> =
    this.itemModel.lazyDataSource;
  private spaceArray: string[] = ['12vp', '16vp', '20vp'];
  private lanesArray: number[] = [1, 2, 3];
  @Consume('appPathStack') appPathStack: NavPathStack;
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_SM;

  jump(pageName: string = 'EmptyPagePathStack'): void {
    this.appPathStack.pushPathByName(pageName, null);
  }

  aboutToAppear() {
    this.loadResources();
  }

  loadResources(): void {
    this.loadingStatus = LoadingStatus.LOADING;
    this.itemModel.getResources().then(() => {
      this.loadingStatus = LoadingStatus.SUCCESS;
    }).catch(() => {
      this.loadingStatus = LoadingStatus.FAILED;
    });
  }

  build() {
    Column() {
      OrderListModuleTitleInfo({
        title: this.moduleTitle,
        moduleRedirectContent: this.moduleRedirectContent,
        onJump: () => {
          this.jump()
        }
      })
      if (this.loadingStatus === LoadingStatus.FAILED) {
        LoadingFailedView(() => this.loadResources())
      }
      if (this.loadingStatus === LoadingStatus.SUCCESS) {
        List({
          space: new BreakpointType(this.spaceArray[0], this.spaceArray[1],
            this.spaceArray[2]).getValue(this.currentWidthBreakpoint)
        }) {
          LazyForEach(this.lazyDataSource, (item: DataSource, index: number) => {
            ListItem() {
              VerticalTextOrderItem1({
                orderDate: item.getOrderDate(),
                icon: item.getIcon(),
                trainNumber: item.getTrainNumber(),
                journey: item.getJourney(),
                orderNumber: item.getOrderNumber(),
                situation: item.getSituation(),
                beginTime: item.getBeginTime(),
                counts: item.getCounts(),
                passenger: item.getPassenger()
              })
            }
            .width(CommonConstants.FULL_PERCENT)
            .height(170)
            .onClick(() => {
              this.jump("OrderListModuleDetail" + index.toString())
            })
          }, (item: DataSource, index: number) => index + JSON.stringify(item))
        }
        .width('auto')
        .height('auto')
        .edgeEffect(EdgeEffect.Spring, { alwaysEnabled: true })
        .listDirection(this.listDirection)
        .alignListItem(ListItemAlign.Center)
        .lanes(new BreakpointType(this.lanesArray[0], this.lanesArray[1],
          this.lanesArray[2]).getValue(this.currentWidthBreakpoint), "12vp")
      }
    }
    .width('92%')
    .borderRadius($r('sys.float.corner_radius_level8'))
    .margin({ bottom: "10vp" })
  }
}

@Component
export struct VerticalTextOrderItem1 {
  @State orderDate: string = '2025年01月16日'
  @State icon: Resource = $r('app.media.icon')
  @State trainNumber: string = 'G7533'
  @State journey: string = '上海南-杭州东'
  @State orderNumber: string = 'EJ21312323236'
  @State situation: string = '已支付'
  @State beginTime: string = '2025-01-18 周六 16:52开'
  @State counts: string = '1张'
  @State passenger: string = '张三'

  build() {
    Column() {
      Row() {
        Text(`下单日期: ${this.orderDate}`)
          .fontSize($r('app.integer.caption_text_M'))
          .fontWeight(FontWeight.Regular)
          .fontColor($r('app.color.font_on_primary'))
      }
      .padding({
        top: 4,
        bottom: 4,
        left: 8,
        right: 8
      })
      .borderRadius($r('sys.float.corner_radius_level8'))
      .backgroundColor($r('app.color.comp_background_emphasize'))

      Column() {
        Row() {
          Image(this.icon)
            .height('30%')
          Text(this.trainNumber)
            .fontSize($r('app.integer.body_text_S'))
            .fontColor($r('app.color.font_primary'))
            .fontWeight(FontWeight.Medium)
            .padding({ left: 8 })
          Text(this.journey)
            .fontSize($r('app.integer.body_text_S'))
            .fontColor($r('app.color.font_primary'))
            .fontWeight(FontWeight.Medium)
            .padding({ left: 8 })
        }
        .width(CommonConstants.FULL_PERCENT)
        .height('30%')
        .backgroundColor($r('app.color.comp_emphasize_secondary'))
        .padding({ left: 12 })
        .borderRadius({ topLeft: $r('sys.float.corner_radius_level8'), topRight: $r('sys.float.corner_radius_level8') })

        Column() {
          Row() {
            Row() {
              Text(`订 单 号 :`)
                .width(50)
                .fontSize($r('app.integer.caption_text_M'))
                .fontColor($r('app.color.font_secondary'))
                .fontWeight(FontWeight.Regular)
                .textAlign(TextAlign.JUSTIFY)
              Text(this.orderNumber)
                .fontSize($r('app.integer.caption_text_M'))
                .fontColor($r('app.color.font_secondary'))
                .fontWeight(FontWeight.Regular)
            }

            Text(this.situation)
              .fontSize($r('app.integer.caption_text_M'))
              .fontColor(this.situation === '已支付' ? $r('app.color.status_success_List_VerticalTextOrderItem1') :
                $r('app.color.status_error_List_VerticalTextOrderItem1'))
          }
          .width(CommonConstants.FULL_PERCENT)
          .justifyContent(FlexAlign.SpaceBetween)
          .padding({ right: 12 })

          Row() {
            Text("发车时间:")
              .width(50)
              .fontSize($r('app.integer.caption_text_M'))
              .fontColor($r('app.color.font_secondary'))
              .fontWeight(FontWeight.Regular)
              .textAlign(TextAlign.JUSTIFY)
            Text(this.beginTime)
              .fontSize($r('app.integer.caption_text_M'))
              .fontColor($r('app.color.font_secondary'))
              .fontWeight(FontWeight.Regular)
          }

          Row() {
            Text("总 张 数 :")
              .width(50)
              .fontSize($r('app.integer.caption_text_M'))
              .fontColor($r('app.color.font_secondary'))
              .fontWeight(FontWeight.Regular)
              .textAlign(TextAlign.JUSTIFY)
            Text(this.counts)
              .fontSize($r('app.integer.caption_text_M'))
              .fontColor($r('app.color.font_secondary'))
              .fontWeight(FontWeight.Regular)
            Text(this.passenger)
              .fontSize($r('app.integer.caption_text_M'))
              .fontColor($r('app.color.font_secondary'))
              .fontWeight(FontWeight.Regular)
              .padding({ left: 4 })
          }
        }
        .width(CommonConstants.FULL_PERCENT)
        .height('70%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .alignItems(HorizontalAlign.Start)
        .padding({ left: 30 })
      }
      .width(CommonConstants.FULL_PERCENT)
      .height('75%')
      .borderRadius($r('sys.float.corner_radius_level8'))
      .margin({ top: 10 })
      .backgroundColor($r('app.color.comp_background_primary_trans'))
    }
    .width(CommonConstants.FULL_PERCENT)
    .height(CommonConstants.FULL_PERCENT)
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
export struct OrderListModuleTitleInfo {
  @StorageLink('currentWidthBreakpoint') currentWidthBreakpoint: string = BreakpointConstants.BREAKPOINT_LG;
  public title: string = '';
  public moduleRedirectContent: string = "查看更多订单";
  @Consume('appPathStack') appPathStack: NavPathStack;
  public onJump?: () => void;

  jump(): void {
    this.appPathStack.pushPathByName('EmptyPagePathStack', null);
  }

  build() {
    if (this.title.length) {
      Row() {
        Text(this.title)
          .fontSize($r('app.integer.subtitle_text_L'))
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.font_primary'))
        Text(this.moduleRedirectContent)
          .fontColor($r('app.color.font_secondary'))
          .fontSize($r('app.integer.body_text_S'))
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            if (this.onJump) {
              this.onJump()
            } else {
              this.jump()
            }
          })
      }
      .width(CommonConstants.FULL_PERCENT)
      .height("44vp")
      .justifyContent(FlexAlign.SpaceBetween)
      .borderRadius($r('sys.float.corner_radius_level8'))
    }
  }
}