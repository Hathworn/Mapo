#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void longKernel(float *data, int N, float value) {
    // Compute unique index for each thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds
    if (idx < N) {
        // Update data at the computed index
        data[idx] += value;
    }
}