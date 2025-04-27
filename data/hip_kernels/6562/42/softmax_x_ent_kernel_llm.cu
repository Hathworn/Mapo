#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Optimize by using a more precise calculation for global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = gridDim.x * blockDim.x; // Calculate total threads

    while (i < n) { // Loop to handle more elements per thread
        float t = truth[i];
        float p = pred[i];
        error[i] = (t > 0.0f) ? -__logf(p) : 0.0f; // Use __logf for faster computation
        delta[i] = t - p;
        i += gridSize; // Advance by total number of threads to process next element
    }
}