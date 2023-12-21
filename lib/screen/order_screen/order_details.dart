import 'package:ecommerce_app/const_final/const.dart';
import 'package:ecommerce_app/screen/order_screen/order_place_details.dart';
import 'package:ecommerce_app/screen/order_screen/order_status.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'as intl;

class OrdersDetails extends StatelessWidget {
  final dynamic data;
  const OrdersDetails({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Order Details",
          style:
          TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              orderStatus(color: Colors.teal,icon: Icons.done,title: 'Order Placed',showDone: data['order_placed']),
              orderStatus(color: Colors.blue,icon: Icons.thumb_up,title: 'Confirmed',showDone: data['order_confirmed']),
              orderStatus(color: Colors.yellow,icon: Icons.car_crash,title: 'On Delivery',showDone: data['order_on_delivery']),
              orderStatus(color: Colors.purple,icon: Icons.done_all_rounded,title: 'Delivered',showDone: data['order_delivered']),
              const Divider(),
              const SizedBox(height:10 ,),
           Container(
             decoration: BoxDecoration(

               border: Border.all(color: Colors.black45)
             ),
             child: Column(
               children: [
                 orderPlaceDetails(
                     d1: data['order_code'],
                     d2: data['shipping_method'],
                     title1: "Order Code",
                     title2: "Shipping Method"
                 ),
                 orderPlaceDetails(
                     d1: intl.DateFormat().add_yMd().format((data['order_date'].toDate())),
                     d2: data['payment_method'],
                     title1: "Order Date",
                     title2: "Payment Method"
                 ),
                 orderPlaceDetails(
                     d1: "Unpaid",
                     d2: "Order Placed",
                     title1: "Payment Status",
                     title2: "Delivery Status"
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Text(
                             "Shipping Address",
                             style:
                             TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                           ),
                           Text(
                             "${data['order_by_name']}",
                             style:
                             const TextStyle(color: Colors.black54),
                           ),
                           Text(
                             "${data['order_by_address']}",
                             style:
                             const TextStyle(color: Colors.black54),
                           ), Text(
                             "${data['order_by_city']}",
                             style:
                             const TextStyle(color: Colors.black54),
                           ), Text(
                             "${data['order_by_state']}",
                             style:
                             const TextStyle(color: Colors.black54),
                           ), Text(
                             "${data['order_by_phone']}",
                             style:
                             const TextStyle(color: Colors.black54),
                           ), Text(
                             "${data['order_by_postalcode']}",
                             style:
                             const TextStyle(color: Colors.black54),
                           ),

                         ],
                       ),
                       SizedBox(
                         width: 130,
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             const Text(
                               "Total Amount",
                               style:
                               TextStyle(color: Colors.black87, fontWeight: FontWeight.w400),
                             ),
                             Text(
                               "${data['total_amount']}",
                               style:
                               TextStyle(color: Colors.teal.shade600, fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),
                       )
                     ],
                   ),
                 )
               ],
             ),
           ),
              const SizedBox(height: 5,),
              const Divider(),
              const SizedBox(height: 10,),
              const Text(
                "Order Product",
                style:
                TextStyle(color: Colors.black87,fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(

                    border: Border.all(color: Colors.black45)
                ),
                margin: const EdgeInsets.only(bottom: 4),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(data['orders'].length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetails(
                          title1: data['orders'][index]['title'],
                          title2: data['orders'][index]['tprice'],
                          d1: "${data['orders'][index]['qty']}x",
                          d2: "Refundable"

                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                          child: Container(
                            width: 30,
                            height: 20,
                            color: Color( data['orders'][index]['color']),
                          ),
                        ),

                      ],
                    );
                  }).toList()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
