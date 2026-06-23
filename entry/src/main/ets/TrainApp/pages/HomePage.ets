import { TravelSearchModule } from '../view/TravelSearchModule';
import { QuickAccessModule } from '../view/QuickAccessModule';
import { PopularDestinationsModule } from '../view/PopularDestinationsModule';
import { TourRecommendationModule } from '../view/TourRecommendationModule';
import { SpecialTicketPromotionModule } from '../view/SpecialTicketPromotionModule';

@Component
export struct HomePage {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        TravelSearchModule()
        QuickAccessModule()
        PopularDestinationsModule()
        TourRecommendationModule()
        SpecialTicketPromotionModule()
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