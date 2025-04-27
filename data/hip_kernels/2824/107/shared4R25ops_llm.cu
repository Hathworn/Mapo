#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shared4R25ops(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        Smem[threadIdx.x] = A[i]; // Load A[i] into shared memory
    }
    __syncthreads();

    if (i < N) {
        // Store commonly repeated B[i] operations in intermediate variables
        float Bi = B[i];
        float Bi2 = Bi * Bi;
        float Ai = A[i];
        float commonTerm = Ai / 3 + 20 * Bi - Ai * Ai;
        
        // Precompute the tan() function only once
        float tanValue = tan(0.2);

        // Combine repetitive arithmetic computations
        float x = tanValue * Bi + commonTerm - 4 * Ai * Bi + 7 * Bi2;
        
        // Simplify access to shared memory using intermediate variables
        float s1 = Smem[(threadIdx.x + 1) % 512];
        float s2 = Smem[(threadIdx.x + 2) % 512];
        float s3 = Smem[(threadIdx.x + 3) % 512];
        float s4 = Smem[(threadIdx.x + 4) % 512];
        
        C[i] = x - 8 + s1 * Ai + 4 * s2 + 3 * Bi * s3 + Ai * s4;
    }
}