import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('test', (tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    const jsonContent = '''
    [
    {"insert":"inserting some content. "},
    {"insert":"@john", "attributes": {"@mention":true, "userId": "john-5231"}},
    {"insert":"\\n"}
    ]
    ''';

    final doc = Document.fromJson(jsonDecode(jsonContent));

    final controller = QuillController(
      document: doc,
      selection: const TextSelection.collapsed(offset: 0),
    );

    final widget = MaterialApp(
        home: Scaffold(
            body: QuillEditor.basic(
                controller: controller,
                readOnly: true,
            ),
        ),
    );
    await tester.pumpWidget(widget);
  });
}
