#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized empty global kernel
__global__ void profileSubphaseNone_kernel() {
    // Kernel does nothing, optimization not applicable.
}