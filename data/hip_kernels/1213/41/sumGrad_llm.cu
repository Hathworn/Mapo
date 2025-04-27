```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumGrad(float* input1, float* input2, float* input3, float* input4, float* output, const int numElem)
{
    size_t i = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize by removing the size calculation and simplify loop
    if (i < numElem) {
        output[i] = input1[i] + input2[i] + input3[i] + input4[i];
    }
}