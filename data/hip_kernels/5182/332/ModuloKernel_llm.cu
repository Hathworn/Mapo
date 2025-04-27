#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ModuloKernel(float* input, int divisor, float* output, int size)
{
    // Utilize a more accurate calculation of the global thread ID
    int id = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;

    // Ensure the id is within the valid range
    if(id < size)
    {
        output[id] = fmodf(input[id], divisor);
    }
}