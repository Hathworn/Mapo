#include "hip/hip_runtime.h"
#include "includes.h"

hipError_t sumWithCuda(int *c, const int *a, const int *b, unsigned int size);

// Global kernel function
__global__ void VectorSum(int *result, const int *vector_a, const int *vector_b)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only perform computation if within bounds
    if (i < size)
    {
        result[i] = vector_a[i] + vector_b[i];
        printf("%d : call kernel function.\n", i);
    }
}