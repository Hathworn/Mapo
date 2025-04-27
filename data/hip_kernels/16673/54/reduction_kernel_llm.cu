#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_kernel(float *g_out, float *g_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    extern __shared__ float s_data[];

    // Initialize shared memory with zero
    s_data[threadIdx.x] = 0.0f;

    // Accumulate input with unrolled grid-stride loop
    for (int i = idx_x; i < size; i += blockDim.x * gridDim.x)
    {
        s_data[threadIdx.x] += g_in[i];
    }

    __syncthreads();

    // Perform tree-based reduction
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (threadIdx.x < stride)
        {
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0)
    {
        g_out[blockIdx.x] = s_data[0];
    }
}