#include "hip/hip_runtime.h"
#include "includes.h"

// Concatenate function remains unchanged
__device__ unsigned int concatenate(float* array)
{
    unsigned int rvalue = 0;
    unsigned int sign;

    for (int i = 0; i < 32; i++)
    {
        sign = (array[i] >= 0);
        rvalue = rvalue | (sign << i);
    }

    return rvalue;
}

__global__ void concatenate_rows_kernel(float *a, unsigned int *b, int size)
{
    // Optimize index calculation with grid-stride loop for better utilization
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < size; i += blockDim.x * gridDim.x)
    {
        b[i] = concatenate(&a[i * 32]);
    }
}