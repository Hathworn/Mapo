#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_MSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    // Calculate flattened global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread index is within bounds
    if (index < nframe * dim) {
        // Calculate indices for the respective arrays
        int k = index / dim;
        int i = index % dim;

        // Calculate pointers for offsets
        float *gradInput_k = gradInput + k * dim;
        float *input_k = input + k * dim;
        float *target_k = target + k * dim;

        // Compute gradient
        gradInput_k[i] = norm * (input_k[i] - target_k[i]);
    }
}