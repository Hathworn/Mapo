```cuda
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poli4(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure idx is within array bounds
    if (idx < N) {
        float x = poli[idx];
        float sqrt_x = sqrt(x);  // Compute sqrt(x) once
        float x2 = x * x;        // Compute x^2 once
        float x3 = x2 * x;       // Compute x^3 once
        
        // Simplified expression with precomputed power terms
        poli[idx] = 5 + 5 * x + 5 * x * sqrt_x + 5 * sqrt_x * x2 + 5 * x * sqrt_x * x2 + 5 * x * sqrt_x * sqrt_x * x2;
    }
}