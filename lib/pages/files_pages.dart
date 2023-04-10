import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class FilesPage extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FilesPage({Key? key, required this.files, required this.onOpenedFile})
      : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Project file"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: widget.files.length,
            itemBuilder: (context, index) {
              final files = widget.files[index];
              return buildListFile(files);
            }));
  }

  Widget buildListFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return InkWell(
      onTap: () {
        widget.onOpenedFile(file);
      },
      child: ListTile(
        title: Text('${file.name}'),
        subtitle: Text('${file.size}'),
        trailing: Text('${file.extension}'),
      ),
    );
  }
}
