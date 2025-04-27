#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ScaleMatrix_Kernel(float *d_a, float alpha, int arraySize)
{
    // Compute global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check bounds
    if (index < arraySize) {
        // Scale element
        d_a[index] = alpha * d_a[index];
    }
}