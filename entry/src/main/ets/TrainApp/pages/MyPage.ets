import { UserProfileModule } from '../view/UserProfileModule';
import { FeatureEntryModule } from '../view/FeatureEntryModule';
import { PromotionModule } from '../view/PromotionModule';
import { CommonToolsRecommendationModule } from '../view/CommonToolsRecommendationModule';

@Component
export struct MyPage {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        UserProfileModule()
        FeatureEntryModule()
        PromotionModule()
        CommonToolsRecommendationModule()
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