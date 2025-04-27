#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_kernel_2(float *g_out, float *g_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ float s_data[];

    // Load data into shared memory with bounds checking
    s_data[threadIdx.x] = (idx_x < size) ? g_in[idx_x] : 0.f;

    __syncthreads();

    // Perform reduction using a more efficient loop
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        // Check and add in the same step
        if (threadIdx.x < stride)
        {
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Only the first thread writes back to global memory
    if (threadIdx.x == 0)
    {
        g_out[blockIdx.x] = s_data[0];
    }
}