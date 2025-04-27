#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D grid stride
    int gridSize = blockDim.x * gridDim.x; // Calculate the total stride based on grid size
    while (i < n) { // Use a loop to iterate over large data
        float diff = truth[i] - pred[i];
        error[i] = diff * diff;
        delta[i] = diff;
        i += gridSize; // Move to the next batch of data within the grid
    }
}