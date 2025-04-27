#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_cudaWarmUpGPU()
{
    // Utilize shared memory for frequently accessed data
    __shared__ int shared_data[BLOCK_SIZE];
    
    int ind = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Simple operation to warm up, no need for modification
    shared_data[threadIdx.x] = ind + 1;

    // Ensures all threads have written to shared memory
    __syncthreads();

    // Example use of shared data for warming up GPU, otherwise no specific operation
    ind = shared_data[threadIdx.x];
}