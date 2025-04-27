#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _add1(int n, float val, float *x) {
    // Calculate global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;

    // Use grid stride loop for better utilization of threads
    for (; i < n; i += gridSize) {
        x[i] += val;
    }
}