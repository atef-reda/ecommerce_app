import 'package:ecommerce_app/controller/cartcontroller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/view/widget/cart/topcardcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/cart/bottomnavigationbarcart.dart';
import '../widget/cart/customitemlistcart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // CartControllerImpl cartController =
    Get.put(CartControllerImpl());
    return Scaffold(
      bottomNavigationBar:
          GetBuilder<CartControllerImpl>(builder: (cartController) {
        return BottomNavigationBarCart(
          price: '${cartController.totalprice}',
          shipping: '10.00',
          totalPrice: '${cartController.totalprice + 10}',
        );
      }),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        elevation: 2,
        centerTitle: true,
        title: Text('My Cart'),
      ),
      body: GetBuilder<CartControllerImpl>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            margin: const EdgeInsets.all(15),
            child: ListView(
              children: [
                // Row(
                //   children: [
                //     IconButton(
                //         icon: Icon(Icons.arrow_back),
                //         onPressed: () {
                //           Navigator.pop(context);
                //         }),
                //         SizedBox(width: 60,),
                //     Text('My Cart',
                //         textAlign: TextAlign.center,
                //         style: Theme.of(context).textTheme.titleLarge),
                //   ],
                // ),
                TopCardCart(
                    message:
                        'You have ${controller.totalcount} items in your cart'),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.data.length,
                        (index) => CustomItemsCartList(
                          onAdd: () {
                            controller.addCart(
                                controller.data[index].itemsId!.toString());
                          },
                          onRemove: () {
                            controller.removeCart(
                                controller.data[index].itemsId!.toString());
                          },
                          count: controller.data[index].itemscount!,
                          price: controller.data[index].itemsprice!,
                          name: controller.data[index].itemsName!,
                          image: controller.data[index].itemsImage!,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
