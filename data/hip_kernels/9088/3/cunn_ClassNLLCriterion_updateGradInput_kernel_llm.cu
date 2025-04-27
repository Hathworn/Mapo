```c
#include "hip/hip_runtime.h"
#include "includes.h"

static const int NTHREADS = 32;

__global__ void cunn_ClassNLLCriterion_updateGradInput_kernel(float *gradInput, float *target, float *weights, float *total_weight, int size_average, int nframe, int ndim, int n_classes) 
{
    // Check total_weight once to minimize divergence
    if (*total_weight <= 0) return;

    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    float norm = size_average ? (1.0f / *total_weight) : 1.0f;

    // Use a single loop over all elements handled by this block
    while (i < nframe) {
        int t = (int)target[i] - 1; // Retrieve target class index
        if (t >= 0 && t < n_classes) {
            gradInput[i * ndim + t] = -(weights ? weights[t] : 1.0f) * norm;
        }
        i += blockDim.x * gridDim.x; // Increment by total number of threads
    }
}