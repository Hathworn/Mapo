#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setToZeros(float *data, int size)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index (optimizing readability)
    
    // Using loop unrolling for better performance
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < size; i += stride)
    {
        data[i] = 0;
    }
}