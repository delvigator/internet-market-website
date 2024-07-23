import 'package:exdevs/components/default_button.dart';
import 'package:exdevs/components/our_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  int numberInBasket = 0;
  int lang = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(child: Image.asset("assets/images/camping.png",width: 50,height: 50,)),
        SizedBox(width: 50,),
        TextButton(onPressed: (){}, child: Text("Подборки", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),)),
        SizedBox(width: 20,),
        TextButton(onPressed: (){}, child: Text("Каталог", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),)),
        const SizedBox(width: 150),
        Container(
          width: 400,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              style: Theme.of(context).textTheme.bodySmall,
              cursorColor: Colors.black45,
              textAlignVertical: TextAlignVertical.center,
              autofocus: false,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                //  contentPadding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                  border: InputBorder.none,
                  icon: const Icon(Icons.search,color: Colors.black45,size: 20,),
                  hintText: "Введите название товара",
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black45)),
            ),
          ),
        ),
        const SizedBox(width: 100,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    lang = 0;
                  });
                },
                child: Text(
                  "RU",
                  style: lang != 0
                      ? Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black45,fontWeight: FontWeight.w100)
                      : Theme.of(context).textTheme.bodyMedium,
                )),
            const Text("|"),
            TextButton(
                onPressed: () {
                  setState(() {
                    lang = 1;
                  });
                },
                child: Text(
                  "EN",
                  style: lang != 1
                      ? Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black45)
                      : Theme.of(context).textTheme.bodyMedium,
                ))
          ],
        ),
        const SizedBox(width: 30,),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: OurColors.focusColorDark,
                )),
            Text(
              numberInBasket.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(width: 50,),
        const SizedBox(
          height: 40,
          width: 120,
          child: DefaultButton(
            textColor: OurColors.textColor,
            text: 'Войти',
            primaryColor: OurColors.focusColor,
          ),
        ),
      ],
    );
  }
}
