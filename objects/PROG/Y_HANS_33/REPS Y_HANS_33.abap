*&---------------------------------------------------------------------*
*& Report y_sampat_33
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT y_hans_33.




* Quick Fix Append ORDER BY PRIMARY KEY to the SELECT statement
* Transport N09K901121 Quick fix test
* Replaced Code:
*SELECT * FROM T077Z INTO TABLE @DATA(LT_DATA107).

SELECT * FROM T077Z INTO TABLE @DATA(LT_DATA107)
 ORDER BY PRIMARY KEY .

* End of Quick Fix


DELETE ADJACENT DUPLICATES FROM lt_data107.
loop at lt_data107 INTO data(ls_data107).
READ TABLE  lt_data107 INTO data(ls_data) index 1 .
    MODIFY lt_data107 FROM ls_data107 .
    exit
.
ENDLOOP.



SELECT * FROM VBAK INTO TABLE @DATA(LT_VBAK)
 ORDER BY PRIMARY KEY .

LOOP at lt_vbak into data(ls_vbak).                  " LOOP AT itab. EXIT/RETURN/LEAVE ... for result of statement at ... line ...
    if ls_vbak-vbeln = '12345'.
       exit.
    endif.
ENDLOOP.

OPEN CURSOR @DATA(dbcur1) FOR
  SELECT knumv, COUNT(*) AS count
         FROM konv group by knumv.


  SELECT wi_id, wi_creator
  INTO TABLE @data(p_wf)
  FROM swwwihead
  WHERE wi_type    EQ 'AB'
    AND wi_stat    EQ 'READY'
    %_HINTS ORACLE 'INDEX("SWWWIHEAD" "SWWWIHEAD~C")'.