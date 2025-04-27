#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poly_div2(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < N) {
        // Store the repeated expressions in temporary variables
        float x = poli[idx];
        float x2 = x * x;
        float x3 = x2 * x;
        float x4 = x3 * x;
        
        // Simplify polynomial evaluation using the temporary variables
        poli[idx] = 5 + x * (7 - x * (9 + x * (5 + x4 + x4))) + x * 0.2;
    }
}