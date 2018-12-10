numeric NumPic; NumPic:=0;
picture LaTeXPic[]; 

if readfrom("mpcirctmp.mp") <> EOF:
  scantokens ("input mpcirctmp.mp");
fi;

vardef TEXPRE text s =
  write "verbatimtex" to "mpcirctmp.mp";
  write s to "mpcirctmp.mp";
  write "etex" to "mpcirctmp.mp";
enddef;

vardef TEX@#(expr txt) =
  NumPic := NumPic + 1 ;
  if string txt :
    write "% figure " & decimal charcode & " : " & char(10) &
    "LaTeXPic[" & decimal NumPic & "] := btex " &
    txt & " etex ;" to "mpcirctmp.mp" ;
    if unknown LaTeXPic[NumPic] :
      thelabel@#("[??]",origin)
    else :
      thelabel@#(LaTeXPic[NumPic],origin)
    fi
  else :
    thelabel@#(txt,origin)
  fi
enddef ;
