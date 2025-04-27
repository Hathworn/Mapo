#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shared4R24ops(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int localIdx = threadIdx.x;

    // Load data to shared memory
    if (i < N) Smem[localIdx] = A[i];
    __syncthreads();

    if (i < N) {
        float a = A[i];
        float b = B[i];
        
        // Pre-compute reused expressions
        float a_div_3 = a / 3.0f;
        float b_mul_7 = b * 7.0f;
        float common_denom = a / 9.0f + 13.0f * b;
        
        // Arithmetic operations using pre-computed expressions
        float x = (a_div_3 + 17.0f * b - a * a + 3.0f * b - 4.0f * a * b + b * b_mul_7) / common_denom;

        // Result computations using shared memory
        C[i] = x - 8.0f 
             + Smem[(localIdx + 1) % 512] * a 
             + 4.0f * Smem[(localIdx + 2) % 512]
             + 3.0f * b * Smem[(localIdx + 3) % 512] 
             + a * Smem[(localIdx + 4) % 512];
    }
}