#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void executeThirdLayer(float *Layer3_Neurons_GPU, float *Layer3_Weights_GPU,float *Layer4_Neurons_GPU)
{
    int blockID = blockIdx.x;
    int weightBegin = blockID * 1251;
    float result = Layer3_Weights_GPU[weightBegin];

    // Use shared memory for Layer3_Neurons to reduce global memory access
    __shared__ float sharedLayer3_Neurons[1250];

    // Calculate a single offset for Layer3 neurons to avoid repeated calculations
    int neuronOffset = 1250 * blockIdx.y;

    if (threadIdx.x < 1250) {
        sharedLayer3_Neurons[threadIdx.x] = Layer3_Neurons_GPU[threadIdx.x + neuronOffset];
    }
    __syncthreads();

    // Use threadID to unroll the loop and parallelize computations
    for (int i = threadIdx.x; i < 1250; i += blockDim.x) {
        result += sharedLayer3_Neurons[i] * Layer3_Weights_GPU[weightBegin + i + 1];
    }

    // Use warp shuffle to reduce the results across the thread block
    __shared__ float blockResult;
    if (threadIdx.x == 0) {
        blockResult = 0;
    }
    __syncthreads();
    
    atomicAdd(&blockResult, result);
    __syncthreads();

    if (threadIdx.x == 0) {
        // Apply activation function and store result
        Layer4_Neurons_GPU[blockID + (100 * blockIdx.y)] = 1.7159 * tanhf(0.66666667 * blockResult);
    }
}
