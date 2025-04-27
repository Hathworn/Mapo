```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAdd(const float* __restrict__ A, const float* __restrict__ B, float* __restrict__ C, int N)
{
    // Compute global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Use shared memory for faster access
    extern __shared__ float shared_A[];
    extern __shared__ float shared_B[];
    
    // Load data from global to shared memory
    if (i < N) {
        shared_A[threadIdx.x] = A[i]; 
        shared_B[threadIdx.x] = B[i]; 
    }
    __syncthreads();

    // Ensure threads have loaded data before computation
    if (i < N)
        C[i] = shared_A[threadIdx.x] + shared_B[threadIdx.x];
}