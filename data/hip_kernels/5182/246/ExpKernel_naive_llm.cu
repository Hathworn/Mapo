#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ExpKernel_optimized(const float * A, int Acount, int Acols, float * out0, int out0count)
{
    // Calculate global thread ID using blockIdx and threadIdx
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure id is within the valid range
    if (id < out0count) 
    {
        // Efficient memory access: use shared memory to cache data for faster access
        __shared__ float shared_A[1024]; // Assuming 1024 threads per block; adjust size if needed
        shared_A[threadIdx.x] = A[id];
        __syncthreads();

        // Perform the exp computation
        out0[id] = exp(shared_A[threadIdx.x]);
    }
}