#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ExponentialFunctionKernel(float exponent, float* input, float* output, int size)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    if (id < size)
    {
        output[id] = pow(input[id], exponent); // Utilize id directly for efficiency
    }
}