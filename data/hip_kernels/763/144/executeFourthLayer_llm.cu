#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void executeFourthLayer(float *Layer4_Neurons_GPU, float *Layer4_Weights_GPU, float *Layer5_Neurons_GPU)
{
    int blockID = blockIdx.x;
    int weightBegin = blockID * 101;

    float result = 0;

    // Access first weight
    result += __ldg(&Layer4_Weights_GPU[weightBegin]);
    ++weightBegin;

    // Loop unrolling for optimization
    #pragma unroll 4
    for (int i = 0; i < 100; ++i)
    {
        result += __ldg(&Layer4_Neurons_GPU[i + (100 * blockIdx.y)]) * __ldg(&Layer4_Weights_GPU[weightBegin + i]);
    }

    result = (1.7159f * tanhf(0.66666667f * result));

    Layer5_Neurons_GPU[blockID + (10 * blockIdx.y)] = result;
}