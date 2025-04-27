#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int arrayCount)
{
    extern __shared__ int dynamicSmem[];
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize memory access pattern by loading data into shared memory
    if (idx < arrayCount) {
        dynamicSmem[threadIdx.x] = array[idx];
        __syncthreads();

        // Perform computation in shared memory to minimize global memory access
        dynamicSmem[threadIdx.x] *= dynamicSmem[threadIdx.x];

        // Write the result back to global memory
        __syncthreads();
        array[idx] = dynamicSmem[threadIdx.x];
    }
}