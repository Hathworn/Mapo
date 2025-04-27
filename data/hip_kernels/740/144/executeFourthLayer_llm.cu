#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void executeFourthLayer(float *Layer4_Neurons_GPU, float *Layer4_Weights_GPU, float *Layer5_Neurons_GPU)
{
    int blockID = blockIdx.x * gridDim.y + blockIdx.y; // Optimize computing blockID
    int weightBegin = blockID * 101;

    float result = Layer4_Weights_GPU[weightBegin]; // Initialize result using the bias term
    ++weightBegin;

    // Using a loop unrolling optimization to enhance performance
    for (int i = 0; i < 100; i += 4)
    {
        result += Layer4_Neurons_GPU[i + (100 * blockIdx.y)] * Layer4_Weights_GPU[weightBegin + i];
        result += Layer4_Neurons_GPU[i + 1 + (100 * blockIdx.y)] * Layer4_Weights_GPU[weightBegin + i + 1];
        result += Layer4_Neurons_GPU[i + 2 + (100 * blockIdx.y)] * Layer4_Weights_GPU[weightBegin + i + 2];
        result += Layer4_Neurons_GPU[i + 3 + (100 * blockIdx.y)] * Layer4_Weights_GPU[weightBegin + i + 3];
    }

    result = (1.7159f * tanhf(0.66666667f * result)); // Apply the activation function

    Layer5_Neurons_GPU[blockID] = result; // Store the result
}