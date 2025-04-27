#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the unique thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Stride for grid-stride loop

    // Loop over the data with grid-stride to allow more blocks to be scheduled
    for (; i < n; i += stride) {
        float t = truth[i];
        float p = pred[i];
        error[i] = -t * log(p + 1e-7f) - (1 - t) * log(1 - p + 1e-7f); // Use a smaller epsilon
        delta[i] = t - p;
    }
}