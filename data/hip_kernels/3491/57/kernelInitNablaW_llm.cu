#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelInitNablaW(float *nabla_w, int tws) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < tws) {
        nabla_w[idx] = 0.0; // Initialize nabla_w to zero
    }
}