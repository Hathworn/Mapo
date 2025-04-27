#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Use shared memory to optimize data access
    extern __shared__ float shared_mem[];
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < numElements)
    {
        // Load inputs to shared memory
        shared_mem[threadIdx.x] = A[i] + B[i];
        __syncthreads();
        // Write result from shared memory
        C[i] = shared_mem[threadIdx.x];
    }
}