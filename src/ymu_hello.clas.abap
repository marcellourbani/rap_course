CLASS ymu_hello DEFINITION FINAL PUBLIC CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: if_oo_adt_classrun.
ENDCLASS.



CLASS YMU_HELLO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( |Hello, world!({ cl_abap_context_info=>get_user_alias(  ) })| ).
  ENDMETHOD.
ENDCLASS.
