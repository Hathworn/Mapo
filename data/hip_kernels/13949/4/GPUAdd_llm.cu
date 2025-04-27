#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GPUAdd(float *array1, float *array2, float *result, int WIDTH)
{
    // Calculate global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Perform out-of-bounds check
    if (i < WIDTH) {
        result[i] = array1[i] + array2[i];
    }
}