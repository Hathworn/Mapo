#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void shared4R1Ws10ops2RG1WG(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory with bounds check
    if (i < N) {
        Smem[threadIdx.x] = A[i];
    }
    __syncthreads();

    // Use a single conditional for computation
    if (i < N) {
        float a_i = A[i];
        float b_i = B[i];
        
        // Compute reused expressions once
        float expr1 = a_i * a_i;
        float expr2 = a_i * b_i;
        float expr3 = b_i * b_i;
        
        // Streamline the expression
        C[i] = a_i + b_i - expr1 + 3 * b_i - 4 * expr2 + expr3 * 7 - 8 
               + Smem[(threadIdx.x + 1) % 512] 
               + Smem[(threadIdx.x + 2) % 512] 
               + Smem[(threadIdx.x + 3) % 512] 
               + Smem[(threadIdx.x + 4) % 512];
    }
}