#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaNoConversion_kernel(float * data, float * tickData, float * tickActivity, float scaling, unsigned int inputDimX, unsigned int inputDimY, unsigned int inputDimZ)
{
    const unsigned int inputSize = inputDimX * inputDimY * inputDimZ;
    const unsigned int batchOffset = blockIdx.x * inputSize;

    // Optimize memory access by using shared memory for frequently accessed data
    __shared__ float sharedData[BLOCK_SIZE]; // Assume BLOCK_SIZE is defined and suitable

    unsigned int idx = threadIdx.x;
    while (idx < inputSize) {
        sharedData[threadIdx.x] = data[idx + batchOffset]; // Load data into shared memory

        __syncthreads(); // Ensure all threads have loaded their data

        float value = sharedData[threadIdx.x];
        tickData[idx + batchOffset] = scaling * value;
        tickActivity[idx + batchOffset] += scaling * value;

        idx += blockDim.x;
    }
}