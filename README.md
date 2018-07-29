# texsuite
Stata programs to merge and compile latex files to .pdf

There are two programs. One allows uses to add text to the start and end of .tex files from inside state and then compile the latex code to pdf using *pdflatex*. The second program merges mant .tex files into a single file.

*Suggested use*: To merge many tables created using esttab or a similar program into a single .tex document and compile this document to .pdf automatically.


## texcompiler
A stata module that allows users to add text to the beginning and the end of a .tex file and then compiles the document to .pdf using pdflatex. texcompiler creates a new duplicate .tex file with the inputted modifications and compiles this new .tex file. Users can apply texcompiler to a single file, a selection of files, or all .tex files located in a specified folder.

*Dependencies*: tknz, appendfile

## texmerge
A stata module that merges .tex files in a specified order and then compiles the merged .tex file to .pdf using pdflatex. Users can input a selection of files to be merged or can merge all .tex files stored in the same folder. Text can also be added to the beginning of the new merged .tex file and the end of the file. This allows users to include preamble arguments such as '\documentclass[]{}' and '\begin{document}' to the .tex file and to close the file using '\end{document}'.

*Dependencies*: tknz, appendfile, texcompiler
