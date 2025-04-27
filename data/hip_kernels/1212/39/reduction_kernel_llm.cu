#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_kernel(float* d_out, float* d_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ float s_data[];

    // Initialize shared memory with input data or zero if out of bounds
    s_data[threadIdx.x] = (idx_x < size) ? d_in[idx_x] : 0.f;

    __syncthreads();

    // Perform reduction
    for (unsigned int stride = 1; stride < blockDim.x; stride *= 2)
    {
        // Check if thread is at a valid index for reduction using bitwise operation
        if ((threadIdx.x & (stride * 2 - 1)) == 0) 
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];

        // Synchronize threads before next iteration
        __syncthreads();
    }

    // Output result to global memory
    if (threadIdx.x == 0)
        d_out[blockIdx.x] = s_data[0];
}