#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int d(void) { return 8; }

// Simplified to remove empty kernel function
__global__ void g(void) {
    // Empty kernel intentionally
}