#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poly_div1(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < N) {
        // Load from global memory once
        float x = poli[idx];
        
        // Precompute common sub-expressions
        float x2 = x * x;
        float x3 = x2 * x;
        float x4 = x3 * x;
        float x5 = x4 * x;
        
        // Use precomputed expressions and optimize polynomial evaluation
        poli[idx] = 5 + x * (7 - x * (9 + x * (5 + x * (5 + x)))) + x / 5.0;
    }
}