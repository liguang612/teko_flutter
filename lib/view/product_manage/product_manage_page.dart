import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teko_flutter/data/constants.dart';
import 'package:teko_flutter/di/di.dart';
import 'package:teko_flutter/domain/entity/product_page/button.dart';
import 'package:teko_flutter/domain/entity/product_page/custom_attributes.dart'
    as attribute;
import 'package:teko_flutter/domain/entity/product_page/product_list.dart';
import 'package:teko_flutter/domain/entity/product_page/product_submit_form.dart';
import 'package:teko_flutter/domain/entity/product_page/title_label.dart';
import 'package:teko_flutter/resources/colors.dart';
import 'package:teko_flutter/resources/themes.dart';
import 'package:teko_flutter/shared/widget/pick_image_button.dart';
import 'package:teko_flutter/shared/widget/primary_button.dart';
import 'package:teko_flutter/shared/widget/primary_textfield.dart';
import 'package:teko_flutter/view/product_manage/cubit/product_cubit.dart';
import 'package:teko_flutter/view/product_manage/product_item.dart';

class ProductManagePage extends StatefulWidget {
  ProductManagePage({super.key});

  @override
  State<ProductManagePage> createState() => _ProductManagePageState();
}

class _ProductManagePageState extends State<ProductManagePage> {
  String? imageUri;
  final ProductCubit cubit = getIt.get();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  TitleLabel? titleLabel;
  ProductSubmitForm? productSubmitForm;
  Button? button;
  ProductList? productList;

  @override
  void initState() {
    super.initState();

    cubit.getProductPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: cubit,
        child: BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {
          if (state is ProductGetProductPageSuccess) {
            for (var element in state.productPage?.data ?? []) {
              if (element is TitleLabel) {
                titleLabel = element;
              } else if (element is ProductSubmitForm) {
                productSubmitForm = element;
              } else if (element is Button) {
                button = element;
              } else if (element is ProductList) {
                productList = element;
              }
            }
          }

          if (state is ProductCreateProductSuccess) {
            productList?.customAttributes?.productlist?.items
                ?.insert(0, state.item);
          }

          if (state is ProductCreateProductFailed) {
            showDialog(
                context: context,
                builder: (context) => Dialog(
                    backgroundColor: AppColor.backgroundColor,
                    child: Container(
                        padding: EdgeInsets.all(16),
                        child: Text('${state.message}'))));
          }
        }, builder: (context, state) {
          if (state is ProductInitial) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return Scaffold(
              appBar: AppBar(
                  backgroundColor: AppColor.backgroundColor,
                  centerTitle: true,
                  title: Text("${titleLabel?.customAttributes?.label?.text}",
                      style: AppTextTheme.titleBold26)),
              backgroundColor: AppColor.backgroundColor,
              body: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: productSubmitForm?.customAttributes?.form
                                ?.map((e) {
                              if (e.type == FormType.text) {
                                return PrimaryTextfield(
                                    isRequired: e.required ?? false,
                                    title: e.label ?? '',
                                    controller: nameController);
                              } else if (e.type == FormType.number) {
                                return PrimaryTextfield(
                                    isRequired: e.required ?? false,
                                    title: e.label ?? '',
                                    controller: priceController,
                                    inputType:
                                        TextInputType.numberWithOptions());
                              } else if (e.type == FormType.fileUpload) {
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${e.label}',
                                          style: AppTextTheme.bodyRegular16),
                                      PickImageButton(
                                          getUri: (uri) => imageUri = uri),
                                    ]);
                              }
                              return Container();
                            }).toList() ??
                            []),
                    const SizedBox(height: 10),
                    PrimaryButton(
                        backgroundColor: AppColor.blue,
                        foregroundColor: AppColor.white,
                        onPressed: createProduct,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        title: '${button?.customAttributes?.button?.text}'),
                    const SizedBox(height: 12),
                    state is ProductWaiting
                        ? CircularProgressIndicator()
                        : Expanded(
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 0.8,
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 12),
                                itemBuilder: (context, index) {
                                  final item = productList?.customAttributes
                                      ?.productlist?.items?[index];

                                  return item != null
                                      ? ProductItem(items: item)
                                      : Container();
                                },
                                itemCount: productList?.customAttributes
                                    ?.productlist?.items?.length))
                  ])));
        }));
  }

  createProduct() {
    cubit.createProductPage(attribute.Items(
        name: nameController.text,
        price: int.tryParse(priceController.text),
        imageSrc: imageUri));
  }
}
