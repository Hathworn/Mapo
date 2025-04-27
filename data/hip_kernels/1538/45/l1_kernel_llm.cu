#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate 1D index for the thread
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid-stride loop

    for (int i = idx; i < n; i += stride) { // Use grid-stride loop for better workload distribution
        float diff = truth[i] - pred[i];
        error[i] = abs(diff);
        delta[i] = (diff > 0) ? 1.0f : -1.0f; // Ensure floating-point arithmetic
    }
}