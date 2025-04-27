#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSSqrt_kernel(unsigned int size, float* data)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory for better cache utilization
    extern __shared__ float shared_data[];
    
    for (unsigned int i = index; i < size; i += stride)
    {
        // Load data into shared memory
        shared_data[threadIdx.x] = data[i];
        __syncthreads();

        // Perform operation using shared memory
        shared_data[threadIdx.x] = sqrt(shared_data[threadIdx.x]);
        __syncthreads();

        // Write back the result to global memory
        data[i] = shared_data[threadIdx.x];
    }
}