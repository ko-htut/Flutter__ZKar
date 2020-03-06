
import 'package:flutter/material.dart';

Future<void> buyErrorDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('လုပ်ဆောင်မှုမအောင်မြင်ပါ'),
        content: Column(
          children: <Widget>[
            const Text(
                "ဝယ်ယူမှု မအောင်မြင်ပါ ။ ဝယ်ယူ၇န်သင့်တွင် စိန် လုံလောက်မှုမ၇ှိပါ... ... ... "),
            Divider(),
            const Text(
                "* စိန်များကို setting ထဲမှ watch video ကို ကြည့်ခြင်းဖြင့် ၇၇ှိနိင်ပါသည်"),
            Divider(),
            const Text(
                "* စိန်များကို ၇ ယူ၇န်အခက်အခဲ ၇ှိပါက ကျွန်ပ်တို့ ထံသို့  facebook page မှတစ်ဆင့်လည်း ဆက်သွယ်၇ယူနိင်ပါသည် ။ "),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('ဟုတ်ပီ'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
