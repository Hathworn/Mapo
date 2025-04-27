#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_kernel(float* d_out, float* d_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ float s_data[];

    // Load input into shared memory, ensuring no out-of-bounds access
    s_data[threadIdx.x] = (idx_x < size) ? d_in[idx_x] : 0.f;

    __syncthreads();

    // Perform reduction using a more efficient loop structure
    for (unsigned int stride = blockDim.x >> 1; stride > 0; stride >>= 1)
    {
        // Reduce within block using warp-level optimizations
        if (threadIdx.x < stride)
        {
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0)
    {
        // Write result for current block to global memory
        d_out[blockIdx.x] = s_data[0];
    }
}