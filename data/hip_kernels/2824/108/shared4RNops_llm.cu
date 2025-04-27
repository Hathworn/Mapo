#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shared4RNops(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        // Load A directly into shared memory for faster access
        Smem[threadIdx.x] = A[i];
        __syncthreads();  // Ensure all data is loaded into shared memory

        // Combine multiple operations to minimize accesses and improve performance
        float a = A[i];
        float b = B[i];
        float x = a * (7 * a - a / 7.0 + b * 6) + b * 19;

        x += a / 3 + 3 * (b - a * x) + x * b * 7;
        
        // Single access point to memory and index calculation optimized
        C[i] = x - 8 + Smem[(threadIdx.x + 1) & 511] * a 
                     + 4 * Smem[(threadIdx.x + 2) & 511] 
                     + 3 * b * Smem[(threadIdx.x + 3) & 511] 
                     + a * Smem[(threadIdx.x + 4) & 511];
    }
}