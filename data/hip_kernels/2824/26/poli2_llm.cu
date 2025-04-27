#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poli2(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is in bounds before processing
    if (idx < N) {
        float x = poli[idx];
        float x2 = x * x; // Precompute x^2 for reuse
        poli[idx] = (4 * x * x2) + (3 * x2) - (7 * x) + 5; // Simplified polynomial calculation
    }
}