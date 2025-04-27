#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_kernel(float *g_out, float *g_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ float s_data[];

    // Accumulate input with grid-stride loop into shared memory
    float input = 0.f;
    for (int i = idx_x; i < size; i += blockDim.x * gridDim.x)
    {
        input += g_in[i];
    }
    s_data[threadIdx.x] = input;

    __syncthreads();

    // Perform reduction
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (threadIdx.x < stride)
        {
            // Use volatile to prevent unnecessary loads/stores
            volatile float *vdata = s_data;
            vdata[threadIdx.x] += vdata[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write result for the block to global memory
    if (threadIdx.x == 0) {
        g_out[blockIdx.x] = s_data[0];
    }
}