#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void poli4(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid global memory access for array out of bounds
    if (idx < N) {
        float x = poli[idx];

        // Compute repeated terms once to reduce arithmetic operations
        float sqrt_x = sqrt(x);
        float x_sqrt_x = x * sqrt_x;
        float x_x_sqrt_x = x * x_sqrt_x;
        
        // Combine like terms to reduce the number of operations
        poli[idx] = 5 + 5 * x + 5 * sqrt_x * x + 10 * x_sqrt_x * x + 5 * sqrt_x * x_x_sqrt_x;
    }
}