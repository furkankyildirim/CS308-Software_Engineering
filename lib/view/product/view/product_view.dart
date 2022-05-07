import 'package:flutter/material.dart';
import 'package:mobile/core/base/state/base_state.dart';
import 'package:mobile/core/base/view/base_widget.dart';
import 'package:mobile/core/init/theme/color_theme.dart';
import 'package:mobile/locator.dart';
import 'package:mobile/core/widgets/productItems/product_page_product.dart';
import 'package:mobile/view/product/model/product_model.dart';
import 'package:mobile/view/product/viewmodel/product_view_model.dart';

class ProductView extends StatefulWidget {
  final ProductModel? product;
  const ProductView({Key? key, this.product}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends BaseState<ProductView> {
  late ProductViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: locator<ProductViewModel>(),
      onModelReady: (dynamic model) async {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (context, value) {
        return Scaffold(
          appBar: _appBar(),
          body: _body(),
          bottomNavigationBar: Container(
            height: 100,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12.0),
                topLeft: Radius.circular(12.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                addToCart(),
                buyNow(),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: const BackButton(
        color: AppColors.black,
      ),
      title: const Text("Product Details"),
      actions: [
        IconButton(
          onPressed: () {
            debugPrint("Cart Button Pressed");
          },
          icon: const Icon(Icons.shopping_bag),
        )
      ],
    );
  }

  ListView _body() => ListView(
        children: [
          RoundedContainer(
              child: Column(
            children: const [
              PageProduct(),
            ],
          )),
        ],
      );

  OutlinedButton addToCart() => OutlinedButton(
        onPressed: () {
          debugPrint("Add to cart button pressed...");
        },
        child: const Text(
          "Add To Cart",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: OutlinedButton.styleFrom(
            primary: AppColors.primary,
            fixedSize: const Size(150, 50),
            side: const BorderSide(width: 1.0, color: AppColors.white)),
      );

  OutlinedButton buyNow() => OutlinedButton(
        onPressed: () {},
        child: const Text(
          "Buy Now",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.white,
            primary: AppColors.white,
            fixedSize: const Size(150, 50),
            side: const BorderSide(width: 1.0, color: AppColors.white)),
      );
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          )),
      child: child,
    );
  }
}
