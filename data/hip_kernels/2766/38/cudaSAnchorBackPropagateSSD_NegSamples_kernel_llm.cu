#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSAnchorBackPropagateSSD_NegSamples_kernel(const float* inputCls, float* diffOutputsCls, const float* confSamples, const int* keySamples, const int nbSamples, const int nbPositive, const unsigned int nbAnchors, const unsigned int outputsHeight, const unsigned int outputsWidth, const unsigned int batchSize)
{
    // Calculate global index. Combined block and thread indexing for better performance
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Only process if index is within valid range
    if (index < nbSamples) 
    {
        // Access the key sample directly using index
        const int indexSamples = keySamples[index];
        
        // Compute error once, store in a local variable for reuse
        const float error = inputCls[indexSamples];
        
        // Directly compute output using the error and save the result
        diffOutputsCls[indexSamples] = -error / (nbPositive * batchSize);
    }
}