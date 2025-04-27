#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square(int *array, int arrayCount)
{
    extern __shared__ int dynamicSmem[];
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;  // Calculate stride for grid-stride loop

    // Grid-stride loop to utilize more threads and improve performance
    for (int i = idx; i < arrayCount; i += stride) {
        array[i] *= array[i];
    }
}