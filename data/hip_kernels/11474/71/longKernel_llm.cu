#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void longKernel(float *data, int N, float value) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (idx < N) { // Ensure within bounds
        data[idx] += value; // Perform operation
    }
}