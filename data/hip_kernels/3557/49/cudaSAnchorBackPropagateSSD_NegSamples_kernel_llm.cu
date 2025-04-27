#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSAnchorBackPropagateSSD_NegSamples_kernel(const float* inputCls, float* diffOutputsCls, const int* keySamples, const int nbSamples, const int nbPositive, const unsigned int nbAnchors, const unsigned int outputsHeight, const unsigned int outputsWidth, const unsigned int batchSize)
{
    // Calculate global index with warp size alignment
    int index = (threadIdx.x + blockIdx.x * blockDim.x);

    if (index < nbSamples) {
        // Read index only once
        int indexSamples = keySamples[index];
        
        // Compute error and update only once
        float error = inputCls[indexSamples];
        diffOutputsCls[indexSamples] = -error / nbPositive;
    }
}