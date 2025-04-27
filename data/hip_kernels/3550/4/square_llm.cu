#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int arrayCount)
{
    extern __shared__ int dynamicSmem[];
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use vectorized load/store and avoid redundant memory access when possible
    for (int i = idx; i < arrayCount; i += blockDim.x * gridDim.x) {
        array[i] *= array[i];
    }
}