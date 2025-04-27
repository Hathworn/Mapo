#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shared4R15ops(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    float x;

    // Load A into shared memory for improved data reuse
    if (i < N) {
        Smem[threadIdx.x] = A[i];
    }
    __syncthreads();

    if (i < N) {
        // Precompute constant expressions
        float tan_val = tan(0.2);
        
        // Simplify repeated calculations and exploit shared memory usage
        x = tan_val * B[i];
        x += A[i] / 3 + 17 * B[i];
        C[i] = x - 8 
             + Smem[(threadIdx.x + 1) % 512] * A[i]
             + 4 * Smem[(threadIdx.x + 2) % 512] 
             + 3 * Smem[(threadIdx.x + 3) % 512] * B[i] 
             + Smem[(threadIdx.x + 4) % 512] * A[i];
    }
}