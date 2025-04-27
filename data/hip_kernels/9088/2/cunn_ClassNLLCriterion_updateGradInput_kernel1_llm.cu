#include "hip/hip_runtime.h"
#include "includes.h"

static const int NTHREADS = 32;

__global__ void cunn_ClassNLLCriterion_updateGradInput_kernel1(float* gradInput, float* weights, float* target, float* total_weight, int size_average, int n_classes)
{
    // Early exit if weighted total is zero or negative
    if (*total_weight <= 0) {
        return;
    }

    // Compute normalization factor
    float norm = size_average ? (1.0f / *total_weight) : 1.0f;

    // Compute thread ID for processing data
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index falls within valid range
    if (idx < n_classes) {
        int t = (int)target[idx] - 1; // Adjust for zero-based indexing
        if (t >= 0 && t < n_classes) {
            gradInput[t] = -(weights ? weights[t] : 1.0f) * norm; // Update gradient input
        }
    }
}
```
