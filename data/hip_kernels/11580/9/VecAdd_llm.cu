#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(float* A, float* B, float* C, int N)
{
    // Calculate global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Use warp-synchronous programming to reduce branching
    int warp_idx = i / warpSize;
    int lane_idx = i % warpSize;

    // Ensure thread and warp index calculation minimizes divergence
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}