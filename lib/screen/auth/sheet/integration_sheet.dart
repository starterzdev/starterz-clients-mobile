import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starterz/provider/providers.dart';

class IntegrationSheet extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authProvider).maybeWhen(
      integrationRequired: () {
        TextEditingController emailController = TextEditingController();
        return Wrap(
          children: [
            Container(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "이메일 주소",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => ref
                            .read(authProvider.notifier)
                            .integrate(emailController.text),
                        style: ButtonStyle(),
                        child: Text(
                          '연동하기',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      registrationRequired: () {
        return Wrap(
          children: [
            Container(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
                child: Column(
                  children: [
                    Text("회원가입 필요..."),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(authProvider.notifier)
                              .cancelAuthenticating();
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(),
                        child: Text(
                          '닫기',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      orElse: () {
        return Wrap(children: [Container()]);
      },
    );
  }
}
