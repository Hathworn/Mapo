#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction_kernel(float *g_out, float *g_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ float s_data[];

    // Load data into shared memory using grid-stride loops
    float sum = 0.0f;
    for (int i = idx_x; i < size; i += blockDim.x * gridDim.x) {
        sum += g_in[i];
    }
    s_data[threadIdx.x] = sum;

    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0) {
        g_out[blockIdx.x] = s_data[0];
    }
}