#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction_kernel(float* d_out, float* d_in, unsigned int size)
{
    unsigned int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    extern __shared__ float s_data[];

    // Initialize shared memory with conditional assignment
    s_data[threadIdx.x] = (idx_x < size) ? d_in[idx_x] : 0.f;

    __syncthreads();

    // Do reduction with loop unrolling
    for (unsigned int stride = 1; stride < blockDim.x; stride *= 2)
    {
        unsigned int index = 2 * stride * threadIdx.x;
        if (threadIdx.x < blockDim.x / (2 * stride)) {
            s_data[index] += s_data[stride + index];
        }

        __syncthreads();
    }

    // Write result to global memory from the first thread
    if (threadIdx.x == 0)
        d_out[blockIdx.x] = s_data[0];
}