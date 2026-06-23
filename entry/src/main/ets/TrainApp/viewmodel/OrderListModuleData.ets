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
import LazyDataSource from '../util/LazyDataSource';

export class Data {
  private static instance: Data;
  lazyDataSource: LazyDataSource<DataSource> = new LazyDataSource();
  static readonly ORDER_DATES: string[] =
    ['2025年01月16日', '2025年01月17日', '2025年01月19日', '2025年01月20日', '2025年02月15日'];
  static readonly ICONS: Resource[] =
    [$r('app.media.icon'), $r('app.media.icon'), $r('app.media.icon'), $r('app.media.icon'), $r('app.media.icon')];
  static readonly TRAIN_NUMBERS: string[] =
    ['G7533', 'G7551', 'G7566', 'G7534', 'G7512'];
  static readonly JOURNEYS: string[] =
    ['上海南-杭州东', '上海虹桥-杭州', '上海松江-杭州西', '杭州东-上海南', '杭州-上海南'];
  static readonly ORDER_NUMBERS: string[] =
    ['EJ2312323236', 'EJ2131223236', 'EJ1313212316', 'EJ2131946536', 'EJ213145336'];
  static readonly SITUATIONS: string[] =
    ['已支付', '未支付', '已支付', '已支付', '已支付'];
  static readonly BEGIN_TIMES: string[] =
    ['2025-01-18 周六 16:52开', '2025-01-18 周六 16:52开', '2025-01-18 周六 16:52开', '2025-01-18 周六 16:52开',
      '2025-01-18 周六 16:52开'];
  static readonly COUNTS: string[] =
    ['1张', '2张', '1张', '2张', '1张'];
  static readonly PASSENGERS: string[] =
    ['张三', '张三 等二人', '张三', '张三', '李四 等三人'];

  constructor() {
  }

  public static getInstance(): Data {
    if (!Data.instance) {
      Data.instance =
        new Data();
    }
    return Data.instance;
  }

  /**
   * Data loaded on current view converts network data into rendering data
   */
  getResources(): Promise<void> {
    /**
     * use your web request here
     */
    return new Promise((resolve: Function) => {
      const modelList: Array<DataSource> = [];
      for (let index = 0; index < Data.ORDER_DATES.length;
        index++) {
        modelList.push(new DataSource(
          Data.ORDER_DATES[index],
          Data.ICONS[index],
          Data.TRAIN_NUMBERS[index],
          Data.JOURNEYS[index],
          Data.ORDER_NUMBERS[index],
          Data.SITUATIONS[index],
          Data.BEGIN_TIMES[index],
          Data.COUNTS[index],
          Data.PASSENGERS[index]));
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}

export class DataSource {
  private orderDate: string;
  private icon: Resource;
  private trainNumber: string;
  private journey: string;
  private orderNumber: string;
  private situation: string;
  private beginTime: string;
  private counts: string;
  private passenger: string;

  constructor(orderDate: string, icon: Resource, trainNumber: string, journey: string, orderNumber: string,
    situation: string, beginTime: string, counts: string, passenger: string) {
    this.orderDate = orderDate;
    this.icon = icon;
    this.trainNumber = trainNumber;
    this.journey = journey;
    this.orderNumber = orderNumber;
    this.situation = situation;
    this.beginTime = beginTime;
    this.counts = counts;
    this.passenger = passenger;
  }

  getOrderDate(): string {
    return this.orderDate;
  }

  getIcon(): Resource {
    return this.icon;
  }

  getTrainNumber(): string {
    return this.trainNumber;
  }

  getJourney(): string {
    return this.journey;
  }

  getOrderNumber(): string {
    return this.orderNumber;
  }

  getSituation(): string {
    return this.situation;
  }

  getBeginTime(): string {
    return this.beginTime;
  }

  getCounts(): string {
    return this.counts;
  }

  getPassenger(): string {
    return this.passenger;
  }
}