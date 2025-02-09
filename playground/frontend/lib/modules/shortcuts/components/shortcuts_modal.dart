/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:playground/constants/font_weight.dart';
import 'package:playground/constants/sizes.dart';
import 'package:playground/modules/shortcuts/components/shortcut_row.dart';
import 'package:playground/modules/shortcuts/constants/global_shortcuts.dart';

const kCloseText = 'CLOSE';
const kButtonBorderRadius = 24.0;
const kButtonWidth = 120.0;
const kButtonHeight = 40.0;
const kDialogPadding = 40.0;

class ShortcutsModal extends StatelessWidget {
  const ShortcutsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Shortcuts'),
      titlePadding: const EdgeInsets.only(
        top: kDialogPadding,
        left: kDialogPadding,
      ),
      contentPadding: const EdgeInsets.all(kDialogPadding),
      actionsPadding: const EdgeInsets.only(
        bottom: kDialogPadding,
        right: kDialogPadding,
      ),
      content: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        runSpacing: kLgSpacing,
        children: [
          ...globalShortcuts.map(
            (shortcut) => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: ShortcutRow(shortcut: shortcut)),
                Expanded(
                  flex: 3,
                  child: Text(
                    shortcut.name,
                    style: const TextStyle(fontWeight: kBoldWeight),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      actions: [
        ElevatedButton(
          child: const Text(kCloseText),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.0),
            fixedSize: MaterialStateProperty.all<Size>(
              const Size(kButtonWidth, kButtonHeight),
            ),
            shape: MaterialStateProperty.all<StadiumBorder>(
              const StadiumBorder(),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
