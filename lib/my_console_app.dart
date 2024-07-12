import 'dart:collection';
import 'dart:io';
import 'dart:math';

import 'package:my_console_app/my_console_app.dart' as my_console_app;

void main(List<String> arguments) {
  // firstTask();
  // secondTask();
  thirdTask();
  // fourthTask();
  // fifthTask();
}

void firstTask() {
  /*
  * ДЗ:
1. Объявить переменную типа данных String, название которой состоит из нескольких слов
2. Создать константу “NUM” типа данных int и задать ей любое значение
3. Создать переменную “word” типа данных String с любым значением
4. Задать значение переменной объявленной в самом начале, которое состояло бы из результата конкатенации константы “NUM”  и переменной “word”.
5. Вывести на экран значение всех переменных в одну строку
6. Добавить только 1 условную конструкцию, которая бы выводила на экран следующее: если значение константы “NUM” меньше нуля - “Вы сохранили отрицательное число”, если же значение больше нуля - “Вы сохранили положительное число”, иначе - “Вы сохранили ноль”
ДЗ на сообразительность:
7. Сделать так, чтобы программа выводила в консоль строку “Введите ваше имя:”
8. Затем считывала имя пользователя, введенное с клавиатуры
9. И в конце здоровалась с пользователем по имени которое вы ввели с клавиатуры*/
  print('------------------------1----------------------------');

  String stringConcatValues;
  const int num = -2;
  String word = 'helloWorld';

  stringConcatValues = '$num $word';

  print('$stringConcatValues  $num  $word');

  if (num > 0) {
    print('Вы сохранили положительное число');
  } else if (num < 0) {
    print('Вы сохранили отрицательное число');
  } else {
    print('Вы сохранили 0');
  }

  print('---------------');
  print('Введите ваше имя');
  String? name = stdin.readLineSync();
  print('Привет $name');
}

void secondTask() {
  /*Создать возвращаемый метод который будет принимать 2 входящих параметра - возраст человека и температуру
   на улице, и возвращать результат в виде строки.
Алгоритм метода должен работать следующим образом:
если возраст человека от 20 до 45 лет и температура на улице от -20 до 30 градусов, то возвращаемый результат - “Можно идти гулять”;
если же человеку меньше 20 лет и температура на улице в диапазоне от 0 до 28 градусов, то результат снова -  “Можно идти гулять”;
а если человеку больше 45 лет, то результат “Можно идти гулять” формируется только тогда когда на улице температура в диапазоне от -10 до 25 градусов;
В остальных случаях метод должен возвращать результат - “Оставайтесь дома”;
В методе main вызвать написанный метод 5 раз с различными входными данными (аргументами) и распечатать результат в консоль.
ДЗ на сообразительность:
Написать метод в котором генерируется случайный возраст public static int generateRandomAge(){........}
При вызове метода, который формирует результат “можно ли идти гулять” использовать генерирование случайного возраста с помощью
метода “generateRandomAge” test(23, 10); test(generateRandomAge(), 10);*/

  print('------------------------2----------------------------');

  int generateRandomAge() {
    return Random().nextInt(50);
  }

  double generateRandomTemp() {
    return Random().nextInt(30 + 30) - 30;
  }

  String info(int age, double temperature) {
    if ((age >= 20 && age <= 45 && temperature >= -20 && temperature <= 30) ||
        (age <= 20 && temperature >= 0 && temperature <= 28) ||
        (age > 45 && temperature >= -10 && temperature <= 25)) {
      return 'Можно идти гулять. Возраст: $age. Температура: $temperature';
    } else {
      return 'Оставайтесь дома. Возраст: $age. Температура: $temperature ';
    }
  }

  print(info(generateRandomAge(), generateRandomTemp()));
  print(info(generateRandomAge(), generateRandomTemp()));
  print(info(generateRandomAge(), generateRandomTemp()));
  print(info(generateRandomAge(), generateRandomTemp()));
  print(info(generateRandomAge(), generateRandomTemp()));
}

void thirdTask() {
  /*ДЗ:
Создать массив дробных (не целых) чисел размером 15 элементов и наполнить его положительными и отрицательными числами;
Затем через цикл “for each” посчитать среднее арифметическое положительных чисел расположенных после первого
отрицательного числа и вывести его на экран (8, -2, -4, 2, 3, 6) =  11/3
ДЗ на сообразительность:
Вам необходимо написать следующий алгоритм сортировки массива по возрастанию: каждую итерацию выбирать самый
минимальный элемент и смещать его в начало. При этом каждую новую итерацию начинать сдвигаясь вправо, то есть
 первый проход — с первого элемента, второй проход — со второго и т.д.
И при каждой итерации распечатывать текущее состояние массива
{-4, -2, 2, 3, 6, 8}*/

  print('------------------------3----------------------------');

  var nums = [
    1.5,
    -2.4,
    3.6,
    7.4,
    -19.1,
    90.2,
    -13.2,
    5.4,
    8.3,
    9.9,
    -11.9,
    14.5,
    32.1,
    25.6,
    18.8
  ];
  var resultNums = [];
  var sum = 0.0;
  var flag = false;
  for (var num in nums) {
    if (num < 0 && !flag) {
      flag = true;
      sum = 0;
      resultNums = [];
    } else {
      sum += num;
      resultNums.add(num);
    }
  }
  print('Положительные числа расположенные после отрицательного: $resultNums');
  print(
      'Среднее арифметическое: $sum / ${resultNums.length} = ${sum / resultNums.length}');

  print('Список до сортировки  $nums');
  var min = nums[0];

  for (var j = 0; j < nums.length; j++) {
    for (var i = 0; i < nums.length; i++) {
      if (i != nums.length - 1 && nums[j] < nums[i]) {
        var n = nums[i];
        nums[i] = nums[j];
        nums[j] = n;
      }
    }
  }
  print('Список после сортировки $nums');
}

void fourthTask() {
  /*a)  В задании нельзя использовать циклы for и for each. Только while и Iterator
b)  Написать приложение которое бы считывало сначала 5 строк которые вводит юзер и сохраняла бы их в Список А.
c)  Затем программа должна отобразить этот список
d)  Потом программа считывает еще 5 строк, которые вводит юзер и помещает их в Список Б. После также отображает его в консоли
e)  Объединить Список А со Списком Б в новый список С следующим образом {A1,B5,А2,Б4,А3,Б3,А4,Б2,А5,Б1}
f)  После объединения отобразить в консоли список С
g)   В конце отсортировать элементы списка С по длине слова, сначала идут String-и с наименьшим количеством символов, и
 распечатать отсортированный список С.*/
  print('------------------------4----------------------------');

  var listA = List<String?>.filled(5, '');
  var iter = listA.iterator;
  var i = 0;
  print('Введите 5 строк списка А через Enter');
  while (iter.moveNext()) {
    listA[i] = stdin.readLineSync();
    i++;
  }
  print('Список А');

  print(listA);

  var listB = List<String?>.filled(5, '');
  i = 0;
  iter = listB.iterator;
  print('Введите 5 строк списка В через Enter');
  while (iter.moveNext()) {
    listB[i] = stdin.readLineSync();
    i++;
  }
  print('Список В');
  print(listB);

  var listC = [];
  var iterA = listA.iterator;
  var listBReversed = listB.reversed;
  var iterB = listBReversed.iterator;
  while (iterA.moveNext() && iterB.moveNext()) {
    listC.add(iterA.current);
    listC.add(iterB.current);
  }
  print('Список С');
  print(listC);

  listC.sort((item1, item2) => item1.length - item2.length);
  print('Отсортированный список С по длине');
  print(listC);
}

void fifthTask() {
  print('------------------------5----------------------------');
  var dictionary = <String, List<String>>{};
  dictionary['Храбрый'] = ['Смелый', 'Отважный', 'Бесстрашный', 'Неустрашимый'];
  dictionary['Неприятный'] = [
    'Противный',
    'Отвратительный',
    'Мерзостный',
    'Омерзительный'
  ];
  dictionary['Буря'] = ['Ураган', 'Тайфун', 'Шторм', 'Циклон'];
  dictionary['Идти'] = ['Шагать', 'Шествовать', 'Ступать', 'Плестись'];
  print(dictionary);

  while (true) {
    print('Введите слово для получения синонима');
    String? word = stdin.readLineSync();
    if (dictionary.keys.contains(word)) {
      var synonyms = dictionary[word];
      var randomSin = synonyms?[Random().nextInt(synonyms.length)];
      print('Синоним: $randomSin');
    }
  }
}
