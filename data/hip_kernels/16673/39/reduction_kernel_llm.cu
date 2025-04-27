#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_kernel(float* d_out, float* d_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    extern __shared__ float s_data[];

    // Use conditional assignment to avoid bank conflicts
    s_data[threadIdx.x] = (idx_x < size) ? d_in[idx_x] : 0.f;
    __syncthreads();

    // Unrolling loop for efficiency
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (threadIdx.x < stride) // Only necessary threads perform work
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        
        __syncthreads(); // synchronize to ensure all operations are complete
    }

    // Thread 0 writes the result for this block to global memory
    if (threadIdx.x == 0)
        d_out[blockIdx.x] = s_data[0];
}