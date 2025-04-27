#include "hip/hip_runtime.h"
#include "includes.h"

// Removed unsafe function to prevent out-of-bounds memory access
__global__ void out_of_bounds_kernel(void) {
    // Kernel does nothing after removing unsafe operations
}