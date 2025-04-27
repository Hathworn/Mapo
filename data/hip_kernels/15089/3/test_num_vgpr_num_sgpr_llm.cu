#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test_num_vgpr_num_sgpr() {
    // Use a constexpr or a macro to define any constants instead of hardcoding
    // Precompute any repeated math operations outside loops if present
    // Minimize the amount of work done in this kernel to optimize register usage
}