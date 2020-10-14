
import 'package:flutter/widgets.dart';
import 'package:preview/preview.dart';
import 'ui/screens/home/home_live_product_page copy.dart';  
void main() {
  runApp(_PreviewApp());
}

class _PreviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreviewPage(
      path: 'ui/screens/home/home_live_product_page copy.dart',
      providers: () => [
        IPhone5(), 
        IPhoneX(), 
        
      ],
    );
  }
}
  