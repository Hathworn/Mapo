#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BackwardCrossEntropy(float *output, float *labels, int nColsOutput, float *dOutput)
{
    // Use threadIdx.x for better parallelization and avoid using blockId.x in loop
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Add boundary check for col
    if (col < nColsOutput) {
        float label = labels[col];
        float out = output[col];

        // Simplify calculation and avoid redundant operations
        float temp = (label / out) - ((1.0f - label) / (1.0f - out));
        dOutput[col] = -temp;
    }
}