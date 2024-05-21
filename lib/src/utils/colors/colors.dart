import 'package:flutter/material.dart';

hexstringtocolor(String hex_color) {
  hex_color= hex_color.toString().replaceAll("#", "");
  if(hex_color.length==6){
    hex_color = "FF" + hex_color;
  }
  return Color(int.parse(hex_color, radix: 16));
}