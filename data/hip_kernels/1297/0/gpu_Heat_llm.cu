#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_Heat (float *u, float *utmp, float *residual, int N) {
    // Calculate global row and column indices
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if indices are within valid range
    if (i > 0 && i < N-1 && j > 0 && j < N-1) {
        // Calculate linear index for current element
        int idx = i * N + j;

        // Compute updated value using stencil
        utmp[idx] = 0.25f * (u[idx - 1] +  // left
                             u[idx + 1] +  // right
                             u[idx - N] +  // top
                             u[idx + N]);  // bottom

        // Calculate difference and update residual
        float diff = utmp[idx] - u[idx];
        residual[idx] = diff * diff;
    }
}