#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Use shared memory for faster access
    __shared__ float shared_data[BLOCK_SIZE];
  
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N)
    {
        // Load data into shared memory
        shared_data[threadIdx.x] = a[idx];
        __syncthreads();
      
        // Perform the squaring operation
        shared_data[threadIdx.x] *= shared_data[threadIdx.x];
      
        __syncthreads();
      
        // Store the result back to global memory
        a[idx] = shared_data[threadIdx.x];
    }
}