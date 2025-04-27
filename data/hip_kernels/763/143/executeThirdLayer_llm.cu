#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void executeThirdLayer(float *Layer3_Neurons_GPU, float *Layer3_Weights_GPU, float *Layer4_Neurons_GPU)
{
    int blockID = blockIdx.x;
    int threadID = threadIdx.x;
    int weightBegin = blockID * 1251;
    
    float result = 0.0f;

    // Use shared memory to load weights if necessary, for improved memory access
    __shared__ float sharedWeights[1251]; 

    if (threadID == 0) {
        sharedWeights[0] = Layer3_Weights_GPU[weightBegin]; // Load bias
    }

    // Load remaining weights into shared memory
    for (int i = threadID; i < 1250; i += blockDim.x) {
        sharedWeights[i + 1] = Layer3_Weights_GPU[weightBegin + 1 + i];
    }
    __syncthreads(); // Ensure all weights are loaded before proceeding

    // Parallel accumulate the result
    float localResult = 0.0f;
    for (int i = threadID; i < 1250; i += blockDim.x) {
        localResult += Layer3_Neurons_GPU[i + (1250 * blockIdx.y)] * sharedWeights[i + 1];
    }

    // Perform reduction of results from all threads
    atomicAdd(&result, localResult);
    __syncthreads(); // Ensure all partial results are accumulated

    if (threadID == 0) {
        result += sharedWeights[0]; // Add bias
        result = 1.7159f * tanhf(0.66666667f * result);
        Layer4_Neurons_GPU[blockID + (100 * blockIdx.y)] = result;
    }
}