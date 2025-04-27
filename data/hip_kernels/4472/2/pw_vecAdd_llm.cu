#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_vecAdd(float *y, float *a, float *b, int n) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use inline computation to prevent excess memory access
    if (i < n) y[i] = __fadd_rd(a[i], b[i]);  // Fast addition for improved performance
}