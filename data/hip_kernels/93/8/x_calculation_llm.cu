#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void x_calculation(float *x, float *r, float *r_squared, int size)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    if (index < size)
    {
        // Cache r_squared[0] to reduce memory access
        float alpha = __ldg(&r_squared[0]);
        x[index] += alpha * r[index];
    }
}