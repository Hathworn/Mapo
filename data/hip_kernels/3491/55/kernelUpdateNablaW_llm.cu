#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelUpdateNablaW(float *nabla_w, float *delta_nabla_w, int tws) {
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index is within bounds and perform addition in one step
    if (idx < tws) {
        nabla_w[idx] += delta_nabla_w[idx];
    }
}