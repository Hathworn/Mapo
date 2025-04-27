#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float* deconcatenate(unsigned int x)
{
    float * array = new float[32];

    for (int i = 0; i < 32; i++)
    {
        array[i] = (x & (1 << i)) >> i;
    }

    return array;
}

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

__global__ void deconcatenate_rows_kernel(unsigned int *a, float *b, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Use thread index for parallelism
    if (idx < size / 32)
    {
        unsigned int val = a[idx];
        for (int k = 0; k < 32; k++)    // Inline deconcatenate for efficiency
        {
            b[idx * 32 + k] = (val & (1 << k)) >> k;
        }
    }
}