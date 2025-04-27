#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_ClassNLLCriterion_updateGradInput_kernel(float *gradInput, float *target, int nframe, int ndim, float grad, int ntarget) {
    // Use blockIdx.x and blockDim.x to distribute work across threads
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < nframe) {
        for (int j = 0; j < ntarget; ++j) {
            int t = static_cast<int>(target[i * ntarget + j]) - 1;
            if (t >= 0) {
                gradInput[i * ndim + t] = grad;
            }
        }
    }
}
```
