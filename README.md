# JoDiff

This program compares two UTF8-text files, outputting all characters of the second file
that are different from the characters in the same place of the first file.

The program is used to find the smallest changes in a file.

## Compilation

The program is written in Oberon using
[Free Oberon IDE](https://free.oberon.org/en/).

Download Free Oberon (version 1.1.0-alpha7), put `JoDiff.Mod` inside it's
`Programs` subdirectory, open the file in Free Oberon and press `F9`. Can be
also compiled using `foc` (command-line compiler that comes with Free Oberon).

## Usage

```
JoDiff <fileA> <fileB>

fileA - the first text file
fileB - the second text file
```

# Ё-Разность

Эта программа сравнивает два файла текста в формате UTF8, выводя все литеры
второго файла, которые отличаются от литер, находящихся на тех же местах
в первом файле.

Программа используется для нахождения минимальных изменений в файле.


## Компиляция

Программа написана на языке Оберон с помощью среды
[Free Oberon](https://free.oberon.org/).

Скачайте Free Oberon (версии 1.1.0-alpha7), поместите файл `JoDiff.Mod` в
подкаталог `Programs`, откройте файл в Free Oberon и нажмите `F9`. Также его
можно скомпилировать с помощью `foc` (компилятора командной строки,
поставляемого с Free Oberon).

## Использование

```
JoDiff <файлА> <файлБ>

файлА - первый текстовый файл
файлБ - второй текстовый файл
```
