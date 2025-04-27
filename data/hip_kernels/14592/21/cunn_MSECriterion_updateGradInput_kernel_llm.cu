#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_MSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    // Calculate the absolute index for each thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index does not exceed the dimension
    if (index < dim * nframe) {
        // Determine the frame
        int k = index / dim;
        
        // Calculate gradInput using the absolute thread index
        gradInput[index] = norm * (input[index] - target[index]);
    }
}