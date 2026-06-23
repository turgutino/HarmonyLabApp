import { HelloCodeGenie } from '../components/HelloCodeGenie';

@Entry
@Component
struct Index {
  build() {
    Column() {
      // Display the HelloCodeGenie component
      HelloCodeGenie()
    }
    .height('100%')
    .width('100%')
  }
}