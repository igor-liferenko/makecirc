numeric NumPic; NumPic:=0;
picture LaTeXPic[]; 

if readfrom("mptextmp.mp") <> EOF:
  scantokens ("input mptextmp.mp");
fi;

vardef TEXPRE text s =
  write "verbatimtex" to "mptextmp.mp";
  write s to "mptextmp.mp";
  write "etex" to "mptextmp.mp";
enddef;

vardef TEX@#(expr txt) =
  NumPic := NumPic + 1 ;
  if string txt :
    write "% figure " & decimal charcode & " : " & char(10) &
    "LaTeXPic[" & decimal NumPic & "] := btex " &
    txt & " etex ;" to "mptextmp.mp" ;
    if unknown LaTeXPic[NumPic] :
      thelabel@#("[??]",origin)
    else :
      thelabel@#(LaTeXPic[NumPic],origin)
    fi
  else :
    thelabel@#(txt,origin)
  fi
enddef ;
