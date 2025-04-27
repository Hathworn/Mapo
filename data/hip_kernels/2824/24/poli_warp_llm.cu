#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void poli_warp(float* poli, const int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds first to avoid unnecessary calculations
    if (idx < N) {
        float x = poli[idx];

        // Refactor polynomial computation for efficiency
        float x2 = x * x;
        float x3 = x2 * x;
        float x4 = x3 * x;

        // Combine terms for less operations
        poli[idx] = 5 + x * (7 - x * (9 + x * (5 + x * (5 + x)))) - 1.0f / x + 3.0f / x2 + x / 5.0f;
    }
}