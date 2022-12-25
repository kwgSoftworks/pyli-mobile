import 'package:cached_network_image/cached_network_image.dart';
import 'package:customerapp/src/controllers/_controllers.dart';
import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/resources/_resources.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FilesListPage extends StatelessWidget {
  const FilesListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FileController());
    return Obx((){
      final allFiles = controller.filteredFileList.isEmpty ? controller.allFiles : controller.filteredFileList;
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            60
          ),
          child: Container(
            color: CColors.primary,
            padding: EdgeInsets.only(
              left: 14,
              right: 14,
              bottom: 12,
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(111),
                  color: CColors.primary_light2
              ),
              child: Stack(
                children: [
                  TextField(
                    controller: controller.searchTextController,
                    onChanged: (text) => controller.onSearch(text),
                    style: GoogleFonts.roboto(
                        color: Colors.white
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none
                        ),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 8
                          ),
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Search',
                        hintStyle: GoogleFonts.roboto(
                            color: Colors.white.withOpacity(.5)
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12)
                    ),
                    cursorColor: Colors.white,
                  ),
                  if(controller.showClearSearch.value) Positioned(
                    right: 8,
                    top: 0,
                    bottom: 0,
                    child: IconButton(
                      onPressed: () => controller.clearSearch(context),
                      constraints: BoxConstraints(),
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [

              Row(
                children: [
                  Expanded(
                    child: CButton(
                      onPressed: (){
                        if(controller.enableEditing.value){
                          controller.clearFileSelection();
                        }else{
                          controller.enableEditing(true);
                        }
                      },
                      color: controller.enableEditing.value ? CColors.primary_light : CColors.yellow,
                      labelColor: CColors.primary,
                      labelSize: 14,
                      label: controller.enableEditing.value ? 'Deselect All' : 'Select',
                      icon: controller.enableEditing.value ? Icons.chevron_left : Icons.check_box
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: controller.enableEditing.value ?
                    CButton(
                      onPressed: controller.deleteFiles,
                      color: CColors.yellow,
                      labelColor: CColors.primary,
                      labelSize: 14,
                      label: 'Delete File${controller.selectedFiles.length > 1 ? 's' : ''}',
                      icon: Icons.delete
                    ) : SizedBox())
                ],
              ),
              SizedBox(height: 20),

              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20
                  ),
                  itemCount: allFiles.length,
                  itemBuilder: (_, index) => _FileWidget(
                    file: allFiles[index],
                    selected: controller.selectedFiles.contains(allFiles[index]),
                    onTap: (){
                      if(controller.enableEditing.value){
                        if(controller.selectedFiles.contains(allFiles[index])){
                          controller.selectedFiles.remove(allFiles[index]);
                        }else{
                          controller.selectedFiles.add(allFiles[index]);
                        }
                      }else{
                        ///view file
                      }

                    },
                    enabledSelection: controller.enableEditing.value
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class _FileWidget extends StatelessWidget {
  final FileModel file;
  final bool selected;
  final bool enabledSelection;
  final VoidCallback onTap;
  const _FileWidget({Key? key, required this.file, required this.selected, required this.onTap, required this.enabledSelection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(enabledSelection) onTap.call();
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: selected ? CColors.primary.withOpacity(.5) : CColors.greyf6
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: file.thumbnail != null ? CachedNetworkImage(
                    imageUrl: file.thumbnail!,
                  ) : Image.asset(
                    Images.thumbnail
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      file.fileName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        color: CColors.black
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if(enabledSelection) Positioned(
            top: 6,
            right: 6,
            child: Icon(
              Icons.radio_button_checked_rounded,
              color: selected ? Colors.white : CColors.black.withOpacity(.5),
            ),
          )
        ],
      ),
    );
  }
}
