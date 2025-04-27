#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sigmoid64(double* A, int size)
{
    // Optimize index calculation using inbuilt function
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds
    if (idx < size) {
        // Efficient computation of sigmoid function
        A[idx] = 1.0 / (1.0 + exp(-A[idx]));
    }
}