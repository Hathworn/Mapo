#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumGrad(float* output, float* input1, float* input2, float* input3, float* input4, const int numElem)
{
    // Calculate global thread ID
    size_t tid = blockDim.x * blockIdx.x + threadIdx.x;
    // Use stride to allow threads to traverse the dataset in case of underutilization
    size_t stride = blockDim.x * gridDim.x;

    for(size_t i = tid; i < numElem; i += stride) {
        // Perform the addition operation
        output[i] = input1[i] + input2[i] + input3[i] + input4[i];
    }
}