#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int arrayCount)
{
    extern __shared__ int dynamicSmem[];
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use shared memory for frequently accessed data
    if (idx < arrayCount) {
        dynamicSmem[threadIdx.x] = array[idx];
        __syncthreads();
        
        dynamicSmem[threadIdx.x] *= dynamicSmem[threadIdx.x];
        
        __syncthreads();
        array[idx] = dynamicSmem[threadIdx.x];
    }
}