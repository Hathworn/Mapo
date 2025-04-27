#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void encode_cols_kernel(float *a, uint32_t* b, int m, int n) {
    // Improve thread indexing for better memory coalescing
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = (blockIdx.y * blockDim.y + threadIdx.y) * ENCODE_BITS;
    
    // Process multiple elements per thread where possible
    if (j < n && i < m) {
        uint32_t r = 0;
        for (int k = 0; k < ENCODE_BITS && (i + k) < m; k++) {
            r |= (a[j + n * (i + k)] > 0) << k;
        }
        b[j + n * (i / ENCODE_BITS)] = r;  // Write result back to global memory
    }
}