#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Interpolate(float* input1, float* input2, float* output, float weight, int inputSize)
{
    // Calculate threadId more efficiently using grid stride loop
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // total number of threads in the grid

    for (int i = threadId; i < inputSize; i += stride)
    {
        // Efficient conditional computation without additional checks
        output[i] = weight <= 0 ? input1[i] : (weight >= 1 ? input2[i] : (1 - weight) * input1[i] + weight * input2[i]);
    }
}