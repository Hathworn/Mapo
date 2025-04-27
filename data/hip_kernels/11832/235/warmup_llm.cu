#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void warmup(float *A, float *B, float *C, const int N)
{
    // Use shared memory to optimize data access
    __shared__ float s_A[1024];
    __shared__ float s_B[1024];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < N) {
        // Load data into shared memory
        s_A[threadIdx.x] = A[i];
        s_B[threadIdx.x] = B[i];
        __syncthreads();

        // Perform addition using shared memory
        C[i] = s_A[threadIdx.x] + s_B[threadIdx.x];
    }
}