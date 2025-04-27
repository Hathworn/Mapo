#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function with optimized indexing
__global__ void poli1(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check within valid range and compute polynomial
    if (idx < N) {
        float x = poli[idx];
        poli[idx] = fmaf(fmaf(3.0f, x, -7.0f), x, 5.0f); // Use FMA for improved performance
    }
}