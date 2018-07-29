*! version 1.0 	 7 December 2016	Author: Iain Snoddy, iainsnoddy@gmail.com

program define texcompiler
	version 12
	syntax anything(name=location), [Saveto(string) Files(string) ///
							PRe(string) POst(string) PDFlatex ]
							
								
	if "`pre'"=="" & "`post'"==""{
		if "`files'"=="" local files: dir "`location'" files "*.tex"
		foreach filename of local files{
			!pdflatex "`location'\\`filename'" "--output-directory" "`location'"
		}
	}
	else {
	
		if "`saveto'"==""{
			di as error "The saveto() option must be provided if"
			di as error "pre() or post() are given"
			exit
		}
		if "`saveto'"=="`location'"{
			di as error "The folder given in saveto() cannot be the same"
			di as error "as the location of the original .tex files"
			exit
		}
		
		if "`files'"=="" local files: dir "`location'" files "*.tex"
		
		if "`pre'"!=""{
			tknz `pre',p("|") s(pre) nochar
			local prenum `s(items)'
		}
		if "`post'"!="" tknz `post',p("|") s(post) nochar
				
		foreach filename of local files{

			file open otexfile using `location'\\`filename', r
			file read otexfile texline
			file open ntexfile using `saveto'\\`filename', w replace
			
			if "`pre'"!=""{
				forvalues i=1/`prenum'{
					file write ntexfile "`pre`i''" _n
				}
			}
			while r(eof)==0{
				file write ntexfile "`texline'" _n
				file read otexfile texline 
			}
			
			file close otexfile
			
			if "`post'"!=""{
				file seek ntexfile eof
				forvalues i=1/`s(items)'{
					file write ntexfile "`post`i''" _n
				}
			}

			file close ntexfile
			
			if "`pdflatex'"!=""	{
			!pdflatex "`saveto'\\`filename'" "--output-directory" "`saveto'"
			}
		}
	}
end


