class ZCL_TESTLOSC definition
  public
  final
  create public .

public section.
 types: begin of ty_data,
        key type string,
        value type string,
        end of ty_data.

        class-methods execute
        returning value(data) type ty_data.