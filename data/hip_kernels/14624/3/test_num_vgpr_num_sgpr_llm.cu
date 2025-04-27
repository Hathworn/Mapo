#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test_num_vgpr_num_sgpr() {
    // This kernel does nothing and doesn't need optimization.
    // Consider adding functionality for a meaningful test.
}
