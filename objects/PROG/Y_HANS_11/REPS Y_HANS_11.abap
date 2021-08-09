*&---------------------------------------------------------------------*
*& Report YTEST111
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Y_HANS_11.

PARAMETERS : i_knumv TYPE konv-knumv,
             i_kposn TYPE konv-kposn,
             i_stunr TYPE konv-stunr,
             i_zaehk TYPE konv-zaehk.


* Quick Fix Append ORDER BY PRIMARY KEY to the SELECT statement
* Transport N09K901121 Quick fix test
* Replaced Code:
*SELECT vbeln FROM VBAK INTO TABLE @DATA(LT_VBAK) WHERE VBELN = '123456'.

SELECT VBELN FROM VBAK INTO TABLE @DATA(LT_VBAK) WHERE VBELN = '123456'
 ORDER BY PRIMARY KEY .

* End of Quick Fix


select vbeln, posnr from vbap INTO TABLE @data(lt_vbap1) for all ENTRIES IN @lt_vbak
WHERE vbeln = @lt_vbak-vbeln.


    select * from likp INTO table @data(gs_likps) for all entries in @lt_vbap1
                 WHERE vbeln = @lt_vbap1-vbeln.      " Unsecure use of FOR ALL ENTRIES
                 " Tenuous use of FOR ALL ENTRIES


read table lt_vbak into data(ls_vbak) index 1.

if sy-subrc EQ 0.
    write : ls_vbak-vbeln.
endif.



* Quick Fix Append ORDER BY PRIMARY KEY to the SELECT statement
* Transport N09K901121 Quick fix test
* Replaced Code:
*SELECT VBELN , POSNR , AEDAT FROM VBAP INTO TABLE @DATA(LT_VBAP) WHERE VBELN = '123456'.

SELECT VBELN , POSNR , AEDAT FROM VBAP INTO TABLE @DATA(LT_VBAP) WHERE VBELN = '123456'
 ORDER BY PRIMARY KEY .

* End of Quick Fix


LOOP at lt_vbap INTO data(ls_vbap) where posnr eq '0010'.
    ls_vbap-AEDAT = '01012020'.
    MODIFY lt_vbap from ls_vbap index 1.
endloop.

select single * from konv INTO @data(lv_konv) where knumv = @i_knumv
                                                and kposn = @i_kposn
                                                and stunr = @i_stunr
                                                and zaehk = @i_zaehk.

if sy-subrc EQ 0.
*   update konv set waers = '12'
*            where knumv = i_knumv
*            and kposn = i_kposn
*            and stunr = i_stunr
*            and zaehk = i_zaehk.
ENDIF.