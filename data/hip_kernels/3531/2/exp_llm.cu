#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to use multi-threading for batched computation
__global__ void exp(float *a, float *c, int n) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    if (idx < n) {
        c[idx] = expf(a[idx]);  // Use parallel computation for array
    }
}