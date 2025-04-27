#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunnx_LazyKBest_updateGradInput_kernel(float *gradInput, const float *indice, const float *gradOutput, int inputSize, int outputSize)
{
    // Use shared memory for better cache locality
    __shared__ float sharedGradOutput[1024];  // Adjust size according to outputSize if necessary
    __shared__ int sharedIndice[1024];        // Adjust size according to outputSize if necessary

    int tx = threadIdx.x;
    int k = blockIdx.x;
    if (tx < outputSize) {
        sharedGradOutput[tx] = gradOutput[k * outputSize + tx];
        sharedIndice[tx] = indice[k * outputSize + tx] - 1;  // Pre-compute -1
    }
    __syncthreads();  // Sync threads after loading to shared memory

    float *gradInput_k = gradInput + k * inputSize;

    // Reduce step size for potential unrolling, processing multiple elements per thread
    for (int i = tx; i < outputSize; i += blockDim.x * 2) {
        gradInput_k[sharedIndice[i]] = sharedGradOutput[i];
        if (i + blockDim.x < outputSize) {  // Check boundary for second element
            gradInput_k[sharedIndice[i + blockDim.x]] = sharedGradOutput[i + blockDim.x];
        }
    }
}