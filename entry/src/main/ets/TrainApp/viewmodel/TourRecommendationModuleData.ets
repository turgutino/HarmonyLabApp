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
  static readonly IMAGES: Resource[] =
    [$r(('app.media.realImageGen_travel_16')), $r(('app.media.realImageGen_travel_3')),
      $r(('app.media.realImageGen_travel_12')),
      $r(('app.media.realImageGen_travel_5'))];
  static readonly TITLE_LABELS: string[] = ['热门', '必玩', '经典', '世界遗产'];
  static readonly TITLES: string[] = ['故宫博物院', '八达岭长城', '颐和园', '天坛公园'];
  static readonly PRICE_TENS: string[] = ['60', '40', '30', '15'];
  static readonly PRICE_DOTS: string[] = ['.00', '.00', '.00', '.00'];
  static readonly PRICE_LABELS: string[] = ['含补贴', '官方直营', '含补贴', '特惠票'];
  static readonly DES_LABELS: string[][] =
    [['免预约', '随时退'], ['导游讲解', '电子票'], ['游船票', '园林通票'], ['晨练票', '古迹参观']];

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
      for (let index = 0; index < Data.IMAGES.length;
        index++) {
        modelList.push(new DataSource(
          Data.IMAGES[index],
          Data.TITLE_LABELS[index],
          Data.TITLES[index],
          Data.PRICE_TENS[index],
          Data.PRICE_DOTS[index],
          Data.PRICE_LABELS[index],
          Data.DES_LABELS[index]
        ));
      }
      this.lazyDataSource.pushArrayData(modelList);
      resolve();
    });
  }
}

export class DataSource {
  private image: Resource;
  private title_label: string;
  private title: string;
  private price_ten: string;
  private price_dot: string;
  private price_label: string;
  private des_labels: string[];

  constructor(image: Resource, title_label: string, title: string,
    price_ten: string, price_dot: string, price_label: string, des_labels: string[]) {
    this.image = image;
    this.title_label = title_label;
    this.title = title;
    this.price_ten = price_ten;
    this.price_dot = price_dot;
    this.price_label = price_label;
    this.des_labels = des_labels;
  }

  getImage(): Resource {
    return this.image
  }

  getTitleLabel(): string {
    return this.title_label;
  }

  getTitle(): string {
    return this.title;
  }

  getPriceTen(): string {
    return this.price_ten;
  }

  getPriceDot(): string {
    return this.price_dot;
  }

  getPriceLabel(): string {
    return this.price_label;
  }

  getDesLabels(): string[] {
    return this.des_labels;
  }
}