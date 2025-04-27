#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_add_scalar_kernel(int n, float a, float *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    int grid_size = blockDim.x * gridDim.x; // Calculate the grid size

    for (; i < n; i += grid_size) { // Loop over elements to maximize memory access
        y[i] += a;
    }
}