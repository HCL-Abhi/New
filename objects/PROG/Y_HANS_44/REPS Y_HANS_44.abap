*&---------------------------------------------------------------------*
*& Report Y_SAMPAT_44
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Y_HANS_44.

PARAMETERS : i_knumv TYPE konv-knumv,
             i_kposn TYPE konv-kposn,
             i_stunr TYPE konv-stunr,
             i_zaehk TYPE konv-zaehk.

select * from vbak into table @data(lt_data123) where vbeln = '123456'.

loop at lt_data123 INTO data(ls_data123).
    MODIFY lt_data123 from ls_data123 ."INDEX 1.      " MODIFY ... INDEX for result of SELECT statement at ... line ...
endloop.


* Quick Fix Append ORDER BY PRIMARY KEY to the SELECT statement
* Transport N09K901121 Quick fix test
* Replaced Code:
* SELECT * FROM VBAK INTO TABLE @DATA(LT_DATA) WHERE VBELN = '123456' .    " Select-Statement can be transformed. ...% of fields used

SELECT * FROM VBAK INTO TABLE @DATA(LT_DATA) WHERE VBELN = '123456'
 ORDER BY PRIMARY KEY .    " Select-Statement can be transformed. ...% of fields used

* End of Quick Fix


read table lt_data into data(ls_data) index 1.


* Quick Fix Append ORDER BY PRIMARY KEY to the SELECT statement
* Transport N09K901121 Quick fix test
* Replaced Code:
*SELECT * FROM KONV INTO TABLE @DATA(LV_KONV) WHERE KNUMV EQ @I_KNUMV
* AND KPOSN EQ @I_KPOSN
* AND STUNR EQ @I_STUNR.

SELECT * FROM KONV INTO TABLE @DATA(LV_KONV) WHERE KNUMV EQ @I_KNUMV
 AND KPOSN EQ @I_KPOSN
 AND STUNR EQ @I_STUNR
 ORDER BY PRIMARY KEY .
* End of Quick Fix

" ORDER BY PRIMARY KEY .

if sy-subrc EQ 0.
    update konv set waers = '12'
            where knumv = i_knumv
            and kposn = i_kposn
            and stunr = i_stunr
            and zaehk = i_zaehk.
ENDIF.