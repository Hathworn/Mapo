#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shared4R1W1G(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds before shared memory access and calculations
    if (i < N) {
        Smem[threadIdx.x] = i; // Store the index in shared memory
        
        // Ensure shared memory accesses stay within bounds using modulo operation
        int idx1 = (threadIdx.x + 1) & 511; // Use bitwise AND instead of modulo for better performance
        int idx2 = (threadIdx.x + 2) & 511;
        int idx3 = (threadIdx.x + 3) & 511;
        int idx4 = (threadIdx.x + 4) & 511;
        
        // Accumulate the result from shared memory
        C[i] = Smem[idx1] + Smem[idx2] + Smem[idx3] + Smem[idx4];
    }
}