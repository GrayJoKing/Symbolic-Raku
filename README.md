# Symbolic Raku
 A version of [Raku (Perl 6)](https://www.raku.org/) inspired by [Symbolic Python](https://esolangs.org/wiki/Symbolic_Python).
 
 Symbolic Raku programs run exactly the same as normal Raku, except with the added restriction that the program will refuse to run if there are any numbers or letters in the program. The numbers and letters aren't necessarily confined to standard ASCII, so numbers like `²` or letters like `и` are still illegal. Basically any program that matches the regex `/<:N+:L>/` will not run.
 
 Since this doesn't allow easy access to the usual methods of input or output, the program is run similar to using the flag `-n`, where the input is placed in the `$_` topic variable, which is then printed at the end of execution using `say`. Warnings are also supressed, since they are rather annoying when you can't do things normally.

### Advice
 Since it is impossible to use define normal variables (since `my` and other declarators are invalid), you will have to rely on predefined variables, such as `$_`, `$!`, and `$/`. There are also some other variables with conditions attached, such as `@_` or `%_` or the anonymous variables `$`, `@`, `%`.
 
 Despite the heavy restrictions, a lot of Raku's operators are still available, if not the named functions. Regexes, code blocks, ternary operators, ranges, all of these are enough to make the language Turing complete, if a bit complex.
 
 To get numeric values you can use `+$` to get `0`, `+!$` to get `1`, and then numify lists of values to get the length. You can shortcut this using ranges, such as `+(' '..'.')` for `15`. While loops can be simulated using codeblocks, where `code while condition` can be `($!={condition && (code;$!())})()`. You can split apart strings using regexes, for example `/.)>(.*)/` will put the first character of `$_` into `~$/` and the rest into `$/[+@]`. Arbitrary strings can be created using the string xor operator `~^` with two strings. There's a helper generator program which can be run with the flag `-g=str`.