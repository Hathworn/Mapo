#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _emul32(int n, float *x, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    int gridSize = blockDim.x * gridDim.x; // Calculate total number of threads in the grid
    for (; i < n; i += gridSize) { // Use for loop for better readability
        y[i] *= x[i];
    }
}