class FileModel{
  final String fileName;
  final String? thumbnail;

  FileModel({
    required this.fileName,
    this.thumbnail
});

  static final demo = <FileModel>[
    FileModel(fileName: 'doc1.pdf', thumbnail: 'https://images.unsplash.com/photo-1656512180363-ed0d14cedd29?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    FileModel(fileName: 'doc2.pdf'),
    FileModel(fileName: 'doc3.pdf', thumbnail: 'https://images.unsplash.com/photo-1656376406194-58d496c7e122?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    FileModel(fileName: 'image1.jpg', thumbnail: 'https://images.unsplash.com/photo-1656440536778-a6f1d40fa8ca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80'),
    FileModel(fileName: 'pdf2.pdf'),
    FileModel(fileName: 'image2.jpg', thumbnail: 'https://images.unsplash.com/photo-1656597256570-ee98218c7175?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
    FileModel(fileName: 'image3.jpg', thumbnail: 'https://images.unsplash.com/photo-1656557164438-68a98251aa35?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80'),
    FileModel(fileName: 'image4.jpg', thumbnail: 'https://images.unsplash.com/photo-1656506308830-7477865e326f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
  ];
}