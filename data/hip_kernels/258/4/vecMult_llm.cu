#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecMult(float* __restrict__ a, float* __restrict__ b, float* __restrict__ c, const int N) {
    // Use shared memory for performance improvement if necessary
    // Calculate flattened array index
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check bounds to prevent memory access violations
    if(i < N) { 
        c[i] = a[i] * b[i];
    }
}