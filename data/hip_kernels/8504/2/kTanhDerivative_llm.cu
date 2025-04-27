#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTanhDerivative(const int nThreads, float const *input, float *output)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Utilize strided loop pattern for better memory access
    for (; i < nThreads; i += blockDim.x * gridDim.x)
    {
        float val = tanh(input[i]);
        output[i] = 1 - (val * val);
    }
}