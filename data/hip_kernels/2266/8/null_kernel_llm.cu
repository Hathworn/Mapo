#include "hip/hip_runtime.h"
#include "includes.h"

// Launch the kernel with a single thread as it's a no-op
__global__ void null_kernel() {
    // No operation performed
};