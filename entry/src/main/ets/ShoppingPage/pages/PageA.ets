import { AppHeaderModule } from '../view/AppHeaderModule';
import { SearchBarModule } from '../view/SearchBarModule';
import { MultiFunctionEntryModule } from '../view/MultiFunctionEntryModule';
import { ProductCardDisplayModule } from '../view/ProductCardDisplayModule';

@Component
export struct PageA {
  private scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column() {
        AppHeaderModule()
        SearchBarModule()
        MultiFunctionEntryModule()
        ProductCardDisplayModule()
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