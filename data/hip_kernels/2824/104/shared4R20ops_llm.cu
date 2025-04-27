#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shared4R20ops(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < N) {
        // Load data into shared memory
        Smem[threadIdx.x] = A[idx];
    }
    __syncthreads();

    if (idx < N) {
        // Use registers for computations
        float Ai = A[idx];
        float Bi = B[idx];
        float term1 = Ai / 3;
        float term2 = 17 * Bi;
        float term3 = -Ai * Ai;
        float term4 = 3 * Bi;
        float term5 = -4 * Ai * Bi;
        float term6 = 7 * Bi * Bi;
        
        // Compute the result
        float x = term1 + term2 + term3 + term4 + term5 + term6;
        
        // Final computation including shared memory accesses
        int s1 = (threadIdx.x + 1) & 511;
        int s2 = (threadIdx.x + 2) & 511;
        int s3 = (threadIdx.x + 3) & 511;
        int s4 = (threadIdx.x + 4) & 511;
        
        C[idx] = x - 8 
               + Smem[s1] * Ai 
               + 4 * Smem[s2] 
               + 3 * Bi * Smem[s3] 
               + Ai * Smem[s4];
    }
}