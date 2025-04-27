#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaSEuclideanSumBackward_kernel(unsigned int size, float* diffInput, float* input, float* output, const float scale, const float beta, float* result)
{
    // Calculate one-dimensional global thread index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory to preload the beta
    __shared__ float sharedBeta;
    if (threadIdx.x == 0) {
        sharedBeta = beta;
    }
    __syncthreads();

    // Combine the two loops with a conditional statement
    for (unsigned int i = index; i < size; i += stride) {
        float outputVal = output[i];
        float computedValue = (outputVal != 0.0f) ? diffInput[i] * scale * (input[i] / outputVal) : 0.0f;
        result[i] = (sharedBeta != 0.0f) ? computedValue + sharedBeta * result[i] : computedValue;
    }
}