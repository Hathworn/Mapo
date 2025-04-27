#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_ClassNLLCriterion_updateGradInput_kernel(float *gradInput, float *target, int nframe, int ndim, float grad, int ntarget) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    if (index < nframe) {  // Ensure threads don't exceed the number of frames
        for (int j = 0; j < ntarget; ++j) {
            int t = static_cast<int>(target[index * ntarget + j]) - 1;
            if (t >= 0) {
                gradInput[index * ndim + t] = grad;  // Set grad input if valid
            }
        }
    }
}