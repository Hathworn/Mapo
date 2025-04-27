#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function for vector addition
__global__ void STREAM_Add_Optimized(float *a, float *b, float *c, size_t len) {
    // Calculate global index
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Process only valid indices
    if (idx < len) {
        c[idx] = a[idx] + b[idx];
    }
}