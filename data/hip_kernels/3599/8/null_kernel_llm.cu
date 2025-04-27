#include "hip/hip_runtime.h"
#include "includes.h"

// Emptied global kernel, as it contains no operations
__global__ void null_kernel() {
    // Nothing to optimize here, kernel does nothing
};