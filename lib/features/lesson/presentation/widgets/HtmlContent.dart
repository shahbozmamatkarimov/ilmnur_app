import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_all/flutter_html_all.dart';
import 'package:flutter/material.dart';

class HtmlContent extends StatelessWidget {
  final String htmlContent;
  final FontSize? fontSize;
  final FontWeight? fontWeight;

  const HtmlContent({
    super.key,
    required this.htmlContent,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlContent,
      extensions: [
        // Kod bloklari uchun syntax highlighting (ixtiyoriy, juda chiroyli bo‘ladi)
        // const CodeExtension(),

        // Table uchun yaxshi stil
        TableHtmlExtension(),

        // Tag uchun custom stil
        TagExtension(
          tagsToExtend: {"strong"},
          builder: (extensionContext) {
            return Text(
              extensionContext.innerHtml,
              style: const TextStyle(fontWeight: FontWeight.bold),
            );
          },
        ),
      ],
      style: {
        // Umumiy stillar
        "body": Style(fontSize: FontSize(14), lineHeight: LineHeight(1.6)),
        "h3": Style(
          fontSize: FontSize(12),
          fontWeight: FontWeight.bold,
          margin: Margins(top: Margin(24), bottom: Margin(12)),
        ),
        "h4": Style(fontSize: FontSize(12), fontWeight: FontWeight.bold),
        "h5": Style(fontSize: FontSize(12), fontWeight: FontWeight.bold),
        "table": Style(
          border: Border.all(color: Colors.grey),
          backgroundColor: Colors.white,
        ),
        "th": Style(
          backgroundColor: Colors.grey.shade200,
          padding: HtmlPaddings.all(4),
          textAlign: TextAlign.center,
        ),
        "td": Style(padding: HtmlPaddings.all(4)),
        "pre": Style(
          backgroundColor: Colors.grey.shade100,
          padding: HtmlPaddings.all(12),
          fontFamily: 'monospace',
        ),
        "code": Style(
          backgroundColor: Colors.grey.shade200,
          fontFamily: 'monospace',
          padding: HtmlPaddings.symmetric(horizontal: 4),
        ),
        "ul": Style(margin: Margins(left: Margin(1))),
        "li": Style(margin: Margins(bottom: Margin(1))),
        "p": Style(
          margin: Margins.all(0),
          fontSize: fontSize ?? FontSize(12),
          fontWeight: fontWeight,
        ),
      },
      onLinkTap: (url, _, __) {
        // Agar link bosilsa (masalan, tashqi saytga o‘tish)
        // launchUrl(Uri.parse(url!));
      },
    );
  }
}
