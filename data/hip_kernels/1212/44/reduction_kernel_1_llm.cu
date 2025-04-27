#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_kernel_1(float* g_out, float* g_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ float s_data[];

    s_data[threadIdx.x] = (idx_x < size) ? g_in[idx_x] : 0.f;

    __syncthreads();

    // Unroll last warp; this avoids divergence and reduces syncthreads overhead
    for (unsigned int stride = blockDim.x / 2; stride > 32; stride >>= 1)
    {
        if (threadIdx.x < stride)
        {
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Process remaining warp with warp-level operations
    if (threadIdx.x < 32)
    {
        volatile float* vs_data = s_data;
        vs_data[threadIdx.x] += vs_data[threadIdx.x + 32];
        vs_data[threadIdx.x] += vs_data[threadIdx.x + 16];
        vs_data[threadIdx.x] += vs_data[threadIdx.x + 8];
        vs_data[threadIdx.x] += vs_data[threadIdx.x + 4];
        vs_data[threadIdx.x] += vs_data[threadIdx.x + 2];
        vs_data[threadIdx.x] += vs_data[threadIdx.x + 1];
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0)
        g_out[blockIdx.x] = s_data[0];
}