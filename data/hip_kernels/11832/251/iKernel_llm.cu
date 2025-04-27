#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void iKernel(float *A, float *B, float *C, const int N)
{
    // Use shared memory for better performance
    extern __shared__ float shared_mem[];
    float *shared_A = shared_mem;
    float *shared_B = shared_mem + blockDim.x;

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        // Load data into shared memory
        shared_A[threadIdx.x] = A[i];
        shared_B[threadIdx.x] = B[i];
        __syncthreads();

        // Perform computation using shared memory
        C[i] = shared_A[threadIdx.x] + shared_B[threadIdx.x];
    }
}