#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addValue(int *array_val, int *b_array_val) {
    extern __shared__ int shared_array[];
    int cacheIndex = threadIdx.x;
    int globalIndex = blockIdx.x * COLUMNS + cacheIndex;
    
    // Load data into shared memory
    shared_array[cacheIndex] = array_val[globalIndex];
    __syncthreads();
    
    int i = blockDim.x / 2;
    while (i > 0) {
        if (cacheIndex < i) {
            // Reduce using shared memory
            shared_array[cacheIndex] += shared_array[cacheIndex + i];
        }
        __syncthreads();
        i /= 2;
    }
    
    // Write result from shared memory to global memory
    if (cacheIndex == 0) {
        b_array_val[blockIdx.x] = shared_array[0];
    }
}