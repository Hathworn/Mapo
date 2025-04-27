#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_MSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if (idx < nframe * dim) 
    {
        // Compute frame index and element index
        int k = idx / dim;
        int i = idx % dim;

        // Pointers to current frame
        float *gradInput_k = gradInput + k * dim;
        float *input_k = input + k * dim;
        float *target_k = target + k * dim;

        // Update gradInput
        gradInput_k[i] = norm * (input_k[i] - target_k[i]);
    }
}