#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_kernel_2(float *g_out, float *g_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    extern __shared__ float s_data[];

    // Initialize shared memory with input or zero if out of bounds
    s_data[threadIdx.x] = (idx_x < size) ? g_in[idx_x] : 0.f;
    __syncthreads();

    // Optimized reduction using power of two halving
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (threadIdx.x < stride)
        {
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        }
        __syncthreads(); // Ensure all accesses are complete before next iteration
    }

    if (threadIdx.x == 0)
    {
        g_out[blockIdx.x] = s_data[0]; // Output final reduction result
    }
}