#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poli3(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds and optimize the polynomial calculation
    if (idx < N) {
        float x = poli[idx];
        float x2 = x * x;
        float x4 = x2 * x2;

        // Use pre-computed values to optimize polynomial calculation
        poli[idx] = 5 * (1 + x * (1 + x * (1 + x2)) + x4);
    }
}