import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/helpers/string_helper.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/screens/billing/add_edit_card_page.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingHomePage extends StatelessWidget {
  const BillingHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BillingController());
    return Container(
      padding: EdgeInsets.all(14),
      child: Obx(()=>Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Expanded(
                child: IgnorePointer(
                  ignoring: controller.editCardMode.value,
                  child: Opacity(
                    opacity: controller.editCardMode.value ? .4 : 1,
                    child: CButton(
                      onPressed: () => Get.to(()=>BillingAddEditCardPage()),
                      color: CColors.primary_light,
                      labelColor: CColors.primary,
                      labelSize: 14,
                      label: 'Add Card',
                      icon: Icons.add,
                      iconColor: CColors.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: CButton(
                  onPressed: () {
                    if(controller.editCardMode.value){
                      controller.editCardMode(false);
                    }else{
                      controller.editCardMode(true);
                    }
                  },
                  color: CColors.yellow,
                  labelColor: CColors.primary,
                  labelSize: 14,
                  label: controller.editCardMode.value ? 'Done' : 'Edit Card',
                  icon: controller.editCardMode.value ? Icons.check_circle : Icons.add,
                  iconColor: CColors.primary,
                )
              )
            ],
          ),
          SizedBox(height: 20),

          SizedBox(
            height: 158,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: CreditCardModel.demo.map((card) => CreditCardWidget(
                card: card,
                onDelete: (){
                  Get.dialog(DeleteDialog(
                    onConfirm: (){},
                    title: 'Delete This Card?',
                    subtitle: 'Are you sure you want to delete this card?',
                    widget: Padding(
                      padding: const EdgeInsets.only(
                        top: 12
                      ),
                      child: AspectRatio(
                        aspectRatio: 254/158,
                        child: CreditCardWidget(
                          card: card,
                          padding: 20
                        ),
                      ),
                    )
                  ));
                },
                onEdit: (){
                  Get.to(()=>BillingAddEditCardPage(
                    card: controller.selectedCard.value,
                  ));
                },
                active: controller.selectedCard.value == card,
                isOdd: CreditCardModel.demo.indexOf(card).isOdd,
                editMode: controller.editCardMode.value,
                onTap: (){
                  controller.selectedCard(card);
                }
              )).toList(),
            ),
          ),
          SizedBox(height: 20),
          IgnorePointer(
            ignoring: controller.editCardMode.value,
            child: Opacity(
              opacity: controller.editCardMode.value ? .4 : 1,
              child: Text(
                'Billing History',
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: CColors.black,
                  fontWeight: FontWeight.w900
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: IgnorePointer(
              ignoring: controller.editCardMode.value,
              child: Opacity(
                opacity: controller.editCardMode.value ? .4 : 1,
                child: ListView.builder(
                  itemCount: BillingModel.demo.length,
                  itemBuilder: (_, index) => _BillingWidget(item: BillingModel.demo[index]),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class _BillingWidget extends StatelessWidget {
  final BillingModel item;
  const _BillingWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: CColors.greyf9,
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: CColors.primary_light,
              shape: BoxShape.circle
            ),
            padding: EdgeInsets.all(4),
            child: Transform.rotate(
              angle: -1,
              child: Icon(
                Icons.arrow_back,
                color: CColors.primary_dark,
              ),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CColors.primary_dark
                  ),
                ),
                Text(
                  item.desc,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    color: CColors.black_w3
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item.date,
                  style: GoogleFonts.roboto(
                    color: CColors.grey_80,
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          Text(
            StringHelper.getBalance(item.amount),
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: CColors.primary
            ),
          )
        ],
      ),
    );
  }
}
