#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void stanh(const int lengthA, const double alpha, const double * __restrict__ a, double * __restrict__ b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x;

    for (; i < lengthA; i += gridStride)  // Loop to handle larger arrays efficiently
    {
        b[i] = alpha * tanh(a[i]);  // Perform computation
    }
}