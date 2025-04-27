#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poli2(float* __restrict__ poli, const int N) {
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds and computations are only done when necessary
    if (idx < N) {
        float x = poli[idx];
        float x2 = x * x;       // Precompute x^2 to reduce redundant calculations
        poli[idx] = 4 * x * x2 + 3 * x2 - 7 * x + 5;
    }
}