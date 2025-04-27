#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDSoftplus_propagate_kernel(double* x, double* y, unsigned int size)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory access; assuming blockDim.x <= size
    __shared__ double s_data[1024]; // Adjust size as needed based on blockDim.x

    for (unsigned int i = index; i < size; i += stride) {
        // Load data into shared memory
        s_data[threadIdx.x] = x[i];
        __syncthreads();

        // Compute softplus and write to output; use shared memory data
        y[i] = log(1.0 + exp(s_data[threadIdx.x]));
        __syncthreads();
    }
}