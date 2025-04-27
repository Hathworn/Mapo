#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poly_div7(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds before processing
    if (idx < N) {
        float x = poli[idx];
        
        // Precompute repeated expressions for optimization
        float x2 = x * x;
        float x3 = x2 * x;
        float x4 = x3 * x;
        
        // Simplified polynomial calculation using precomputed powers
        poli[idx] = 5 + x * (7 - x * (9 + x * (5 + x * (5 + x)))) + 1.0f / x;
    }
}