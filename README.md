# :computer: CODE - asm
This repository is a collection of usefull functions to use in various programming languages, with the peculiarity that they have been optimized directly in <strong>Assembly</strong>.
<br>
<br>
This functions are the templates for more complex (or even for the exact same) implementations in higher programming language: take as example the function <em>"swap.S"</em>, which can be take as the base for the implementation of <em>"array_swap.S"</em>, a function used specifically on arrays, but based on the general swap function.
<br>
<br>

## :question: How to use the repo
Since there is not an unique <strong>Assembly programming language</strong>, the repo has been divided in different subfolders, each one for a specific Architecture:<br>
  - <strong>RISC-V :</strong> implementation for the RISC-V Architecture of the Assembly functions.
  - <strong>x86 :</strong> implementation for the x86 Architecture of the Assembly functions.
<br>

## :arrows_counterclockwise: Architecture differences
Since different Systems are based on different Architectures, some functions may need to be adapted for the desired System in order to work properly.
<br>
<br>
In particular:<br>
  - <strong>RISC-V :</strong> this functions are compatible with both RISC-V32 and RISC-V64, but some specific operations have been calculated based on 64-bit Systems (such as offsets and addresses length).
  - <strong>x86 :</strong> this functions are compatible with x86_64 Architecture (since most PC's are based on it), so have been used 64-bit registers; this implies that the majority of the operations have to be recalibrated if you want to use a x86_32 Architecture.
<br>

## :heavy_plus_sign: Multiple types
Since in <strong>Assembly</strong> for each type must be used different operations (sometimes even different registers), each function is preceded by the macro <strong><em>"#ifdef X_TYPE"</em></strong>, where X indicates the type.
<br>
<br>
For example, into the <strong><em>"#ifdef INT_TYPE"</em></strong> condition, takes place the implementation of <em>"function_int"</em>, wich differs from the one into the <strong><em>"#ifdef FLOAT_TYPE"</em></strong> condition.