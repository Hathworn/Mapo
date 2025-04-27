#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kern_MinBuffers(float* b1, float* b2, int size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    
    if(idx < size) // Perform operations only if index is within size
    {
        float value1 = b1[idx];
        float value2 = b2[idx];
        b1[idx] = (value1 < value2) ? value1 : value2; // Directly assign min value to b1
    }
}