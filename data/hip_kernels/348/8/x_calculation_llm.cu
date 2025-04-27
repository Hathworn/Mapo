#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void x_calculation(float * x, float * r, float * r_squared, int size)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (index < size)
    {
        // Using register for alpha and performing computation only once per block
        float alpha = r_squared[0];
        x[index] = fmaf(alpha, r[index], x[index]); // Fused multiply-add for better performance
    }
}