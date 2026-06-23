import { UserProfileModule } from '../view/UserProfileModule';
import { FeatureEntryModule } from '../view/FeatureEntryModule';
import { NewUserCouponBannerModule } from '../view/NewUserCouponBannerModule';
import { ServiceRecommendationModule } from '../view/ServiceRecommendationModule';

@Component
export struct PageB {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        UserProfileModule()
        FeatureEntryModule()
        NewUserCouponBannerModule()
        ServiceRecommendationModule()
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
    .height("100%")
    .width('100%')
    .align(Alignment.Top)
    .backgroundColor($r('app.color.page_bg_color'))
  }
}