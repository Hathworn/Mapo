#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSSoftplus_backPropagate_kernel(float* x, float* dx, unsigned int size)
{
    // Use shared memory for frequently accessed data
    __shared__ float shared_x[256]; // Assuming 256 threads per block as an example. Adjust size if needed.
    
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    for (unsigned int i = index; i < size; i += stride) {
        // Load data to shared memory
        shared_x[threadIdx.x] = x[i];

        __syncthreads(); // Ensure all threads have loaded their data

        // Use shared memory for repeated computation
        dx[i] *= (1.0f - exp(-shared_x[threadIdx.x]));

        __syncthreads(); // Ensure all threads have completed computation before next iteration
    }
}