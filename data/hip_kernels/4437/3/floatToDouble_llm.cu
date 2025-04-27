#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void floatToDouble(float* input, double* output, int numElements)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop to reduce instruction overhead
    #pragma unroll
    for (; i < numElements; i += blockDim.x * gridDim.x)
    {
        output[i] = static_cast<double>(input[i]);
    }
}