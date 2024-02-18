  include "../zx-core/libs/result/set_result_h.asm"
  include "../zx-core/libs/result/set_result.asm"

 MODULE TestSuite_Cells

UT_set_C:
  SCF
  TEST_FLAG_C
  CALL ret_false
  TEST_FLAG_NC
  TC_END

UT_reset_C:
  SCF ; устанавливаем бит переноса и инвертируем его ))
  CCF
  TEST_FLAG_NC
  CALL ret_true
  TEST_FLAG_C
  TC_END
  
 ENDMODULE
