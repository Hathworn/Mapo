#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ForwardCrossEntropy(float *output, float *labels, int nColsOutput, float *loss)
{
    int col = blockIdx.x * blockDim.x + threadIdx.x; // Use grid stride loop for robustness
    if (col < nColsOutput) { // Ensure within bounds
        float temp = -(labels[col] * logf(output[col]) + logf(1.0f - output[col]) * (1.0f - labels[col]));
        atomicAdd(loss, temp); // Accumulate loss safely
    }
}