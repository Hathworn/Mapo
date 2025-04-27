#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void longKernel(float *data, int N, float value) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int stride = gridDim.x * blockDim.x; // Calculate total number of threads in the grid
    for (int i = idx; i < N; i += stride) { // Spread work across multiple threads
        data[i] += value;
    }
}