#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void executeFourthLayer(float *Layer4_Neurons_GPU, float *Layer4_Weights_GPU, float *Layer5_Neurons_GPU)
{
    int blockID = blockIdx.x;
    int weightBegin = blockID * 101;

    // Initialize result with the bias term
    float result = Layer4_Weights_GPU[weightBegin];
    ++weightBegin;

    // Use shared memory to cache Layer4_Neurons_GPU values for improved memory access speed
    __shared__ float sharedNeurons[100];
    int neuronIdx = threadIdx.x;
    if (neuronIdx < 100) {
        sharedNeurons[neuronIdx] = Layer4_Neurons_GPU[neuronIdx + (100 * blockIdx.y)];
    }
    __syncthreads();

    // Parallel reduction over neurons and weights
    float partialSum = 0;
    for (int i = threadIdx.x; i < 100; i += blockDim.x) {
        partialSum += sharedNeurons[i] * Layer4_Weights_GPU[weightBegin + i];
    }

    // Aggregate partial sums from all threads in the block
    atomicAdd(&result, partialSum);

    // Ensure all reduction operations are completed
    __syncthreads();

    // Apply activation function
    if (neuronIdx == 0) {
        result = (1.7159f * tanhf(0.66666667f * result));
        Layer5_Neurons_GPU[blockID + (10 * blockIdx.y)] = result;
    }
}