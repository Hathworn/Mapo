#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int N)
{
    // Use shared memory for better memory access performance
    extern __shared__ float shared[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        shared[threadIdx.x] = A[i] + B[i];
        __syncthreads(); // Ensure all threads have written to shared memory
        C[i] = shared[threadIdx.x];
    }
}