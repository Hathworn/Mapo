#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void floatToDouble(float* input, double* output, int numElements)
{
    // Use shared memory to reduce global memory access latency
    extern __shared__ float sharedInput[];

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int tid = threadIdx.x;

    // Load input to shared memory
    if (i < numElements) {
        sharedInput[tid] = input[i];
    }
    __syncthreads();

    // Perform computation using shared memory
    if (i < numElements) {
        output[i] = static_cast<double>(sharedInput[tid]);
    }
}