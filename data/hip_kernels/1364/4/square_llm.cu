#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square(int *array, int arrayCount)
{
    // Calculate unique global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory bandwidth
    extern __shared__ int dynamicSmem[];
    if (idx < arrayCount) {
        dynamicSmem[threadIdx.x] = array[idx];
        __syncthreads();
        
        // Perform the computation in shared memory
        dynamicSmem[threadIdx.x] *= dynamicSmem[threadIdx.x];
        
        __syncthreads();
        // Write the result back to global memory
        array[idx] = dynamicSmem[threadIdx.x];
    }
}