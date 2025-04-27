#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_kernel_1(float* g_out, float* g_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ float s_data[];

    // Load input elements into shared memory
    s_data[threadIdx.x] = (idx_x < size) ? g_in[idx_x] : 0.f;

    __syncthreads();

    // Optimize reduction using unrolling and warp-level primitives
    // Unroll the loop and use warp reduce
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (threadIdx.x < stride)
        {
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        }
        __syncthreads();  // Ensure all threads have completed warp reduction
    }

    // Store the result from each block in the global memory
    if (threadIdx.x == 0)
    {
        g_out[blockIdx.x] = s_data[0];
    }
}