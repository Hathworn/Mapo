#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poly_div5(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < N) {
        float x = poli[idx];
        
        // Calculate powers of x to minimize repeated calculations
        float x2 = x * x;
        float x3 = x2 * x;
        float x4 = x3 * x;
        float x5 = x4 * x;
        
        // Compute polynomial using precomputed powers
        float result = 5 + x * (7 - x * (9 + x * (5 + x * (5 + x5))));
        
        // Avoid division inside the polynomial expression to prevent unnecessary complexity
        result += 1.0 / x;

        poli[idx] = result;
    }
}