import 'package:customerapp/src/models/_models.dart';
import 'package:customerapp/src/widgets/_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileController extends GetxController{
  RxBool enableEditing = RxBool(false);
  RxList<FileModel> allFiles = FileModel.demo.obs;
  RxList<FileModel> filteredFileList = RxList();
  RxList<FileModel> selectedFiles = RxList();

  void clearFileSelection(){
    selectedFiles.clear();
    enableEditing(false);
  }

  RxBool showClearSearch = RxBool(false);
  final searchTextController = TextEditingController();
  void onSearch(String searchText){
    filteredFileList.clear();
    showClearSearch(true);
    for(int i=0; i<allFiles.length; i++){
      final file = allFiles[i];
      if(file.fileName.toLowerCase().contains(searchText.toLowerCase())){
        filteredFileList.add(file);
      }
    }
  }

  void clearSearch(BuildContext context){
    searchTextController.clear();
    filteredFileList.clear();
    showClearSearch(false);
    FocusScope.of(context).unfocus();
  }

  void deleteFiles() {
    if(selectedFiles.isEmpty) return ;
    Get.dialog(DeleteDialog(
      onConfirm: (){},
      title: 'Delete Files?',
      subtitle: 'Are you sure you want to Delete ${selectedFiles.length} files?',
    ));
  }
}