#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalize_kernel(int N, float *x, float *mean, float *variance, int batch, int filters, int spatial)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified computation of index
    int gridSize = gridDim.x * blockDim.x; // Compute grid size

    while (index < N) { // Loop for processing elements in same thread
        int f = (index / spatial) % filters;

        x[index] = (x[index] - mean[f]) / (sqrtf(variance[f]) + .000001f); // Use sqrtf for better precision
        index += gridSize; // Move to the next element this thread should process
    }
}