{smcl}
{* *! version 1.2.1  8dec2016}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help texcompiler"}{...}
{viewerjumpto "Syntax" "texcompiler##syntax"}{...}
{viewerjumpto "Description" "texcompiler##description"}{...}
{viewerjumpto "Options" "texcompiler##options"}{...}
{viewerjumpto "Remarks" "texcompiler##remarks"}{...}
{viewerjumpto "Examples" "texcompiler##examples"}{...}
{title:Title}

{phang}
{bf:texcompiler} {hline 2} Adds lines to the beggining and end of a .tex file
and compiles the file

{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:texcompiler}
{it:input_folder}{cmd:,} {cmdab:s:aveto(}{it:output_folder}{cmd:)} 
[{it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt s:aveto(output_name)}}output folder {p_end}
{synopt:{opt f:iles(filenames)}}list of files to be processed; default is for all
        .tex files in {it:input_folder} to be processed{p_end}
{synopt:{opt pr:e(string)}}adds text to the beginning of the .tex document {p_end}
{synopt:{opt po:st(string)}}adds text to the end of the .tex document{p_end}
{synopt:{opt pdf:latex}}if specified .tex file will be compiled using pdflatex {p_end}
{synoptline}
{p2colreset}{...}


{marker description}{...}
{title:Description}

{pstd}
{cmd:texcompiler} creates new .tex files from files located in {it:input_folder}. The new .tex files
include additional text at the beginning and end of the document and are compiled using pdflatex to
create .pdf documents. New .tex and .pdf files are saved in {it:output_folder}. The same operation is 
performed separately on each inputted .tex file.


{marker options}{...}
{title:Options}

{dlgtab:Main}

{phang}
{opt saveto(output_folder)} specifies that new .tex and .pdf files will be  saved in
				{it:output_folder}.

{phang}
{opt files(filenames)} restricts processing to specified files. These files must
			be located in {it:input_folder}. Input should follow the format 
			"file1.tex file2.tex file3.tex ...".
				
{phang}
{opt pre(string)} adds text in {it:string} to the beginning of the .tex file. To add multiple lines
of text parse each separate line with "|". 

{phang}
{opt post(string)} adds text in {it:string} to the end of the .tex file. To add multiple lines
of text parse each separate line with "|". 
			
{phang}
{opt pdflatex} specifies that output .tex file will be compiled using pdflatex. The compiled file will
be saved in {it:output_folder}.

{marker remarks}{...}
{title:Remarks}

{pstd}
The same operation is performed on all files given as input. Separate .tex and .pdf output files will
be generated for each file inputted to {cmd:texcompiler} and the same additional lines will be added
to each .tex file.

{pstd}
If neither {opt pre} or {opt post} options are supplied then no new .tex files are created and the original
.tex files are compiled using pdflatex by default, with the output being stored in {it:input_folder}. In this
case options {opt saveto} and {opt pdflatex} are not required and will be ignored if provided.

{pstd}
{cmd:texcompiler} requires {bf:{help tknz:tknz}} to be installed.


{marker examples}{...}
{title:Examples}

{pstd}{bf:Example 1: Compiling to .pdf with no modifications}

{pstd}Compile all .tex files in a folder with no further modifications.{p_end}
{phang2}{cmd:. texcompiler C:\Users\texfiles}{p_end}

{pstd}Compile select files with no further modifications.{p_end}
{phang2}{cmd:. texcompiler C:\Users\texfiles, f(file1.tex file2.tex) }{p_end}


{pstd}{bf:Example 2: Compiling to .pdf with modifications to the .tex file}

{pstd}Suppose we want to add text to the beginning and end of all .tex files in
C:\Users\texfiles and compile them. We would like .tex files to look like:{p_end}
{phang2}{bf: \documentclass[12pt]{article}}{p_end}
{phang2}{bf: \usepackage{fullpage}}{p_end}
{phang2}{bf: \being{document}}{p_end}
{phang2}{bf: first line in input .tex file}{p_end}
{phang2}{bf: second line in input .tex file}{p_end}
{phang2}{bf: ...}{p_end}
{phang2}{bf: ...}{p_end}
{phang2}{bf: \end{document}}{p_end}

{pstd}This is achieved by the following:{p_end}
{phang2}{cmd:. local begin "\documentclass[12pt]{article} | \usepackage{fullpage} | \begin{document}"}{p_end}
{phang2}{cmd:. local end "\end{document}"}{p_end}
{phang2}{cmd:. texcompiler C:\Users\texfiles, s(C:Users\newdofiles) pr(`begin') po(`end') pdflatex}{p_end}


{marker author}{...}
{title:Author}

{pstd}Iain Snoddy{p_end}
{pstd}iainsnoddy@gmail.com{p_end}
