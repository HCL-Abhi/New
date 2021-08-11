class-pool .
*"* class pool for class ZCL_TESTLOSC

*"* local type definitions
include ZCL_TESTLOSC==================ccdef.

*"* class ZCL_TESTLOSC definition
*"* public declarations
  include ZCL_TESTLOSC==================cu.
*"* protected declarations
  include ZCL_TESTLOSC==================co.
*"* private declarations
  include ZCL_TESTLOSC==================ci.
endclass. "ZCL_TESTLOSC definition

*"* macro definitions
include ZCL_TESTLOSC==================ccmac.
*"* local class implementation
include ZCL_TESTLOSC==================ccimp.

*"* test class
include ZCL_TESTLOSC==================ccau.

class ZCL_TESTLOSC implementation.
*"* method's implementations
  include methods.
endclass. "ZCL_TESTLOSC implementation
