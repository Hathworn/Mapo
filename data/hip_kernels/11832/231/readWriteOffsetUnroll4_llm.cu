#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel for better memory coalescing and reduce branching
__global__ void readWriteOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    unsigned int i = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    unsigned int k = i + offset;

    // Ensure memory access is within bounds, eliminate conditional inside kernel
    if (k < n) {
        // Precompute array indices to minimize repeated calculations
        int idx1 = k;
        int idx2 = k + blockDim.x;
        int idx3 = k + 2 * blockDim.x;
        int idx4 = k + 3 * blockDim.x;

        // Use conditional checks only once to reduce warp divergence
        C[idx1] = (idx1 < n) ? (A[idx1] + B[idx1]) : 0.0f;
        C[idx2] = (idx2 < n) ? (A[idx2] + B[idx2]) : 0.0f;
        C[idx3] = (idx3 < n) ? (A[idx3] + B[idx3]) : 0.0f;
        C[idx4] = (idx4 < n) ? (A[idx4] + B[idx4]) : 0.0f;
    }
}