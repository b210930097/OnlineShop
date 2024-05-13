import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatefulWidget {
  final ValueChanged<String?> onChanged;
  const Search({required this.onChanged, Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icon/search.svg'),
        const SizedBox(width: 18),
        Expanded(
          child: TextField(
            onChanged: widget.onChanged,
            decoration: const InputDecoration(
                hintText: 'Хайх', border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
