#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_kernel(float *c, const float* a, const float* b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for repeated access to input arrays
    __shared__ float shared_a[blockDim.x];
    __shared__ float shared_b[blockDim.x];

    shared_a[threadIdx.x] = a[idx];
    shared_b[threadIdx.x] = b[idx];

    __syncthreads(); // Ensure input arrays are fully loaded into shared memory

    for (int i = 0; i < 500; i++)
    {
        // Read data from shared memory instead of global memory
        c[idx] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
    }
}