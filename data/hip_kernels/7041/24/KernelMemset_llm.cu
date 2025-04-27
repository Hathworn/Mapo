#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int DeviceDefaultStep() {
    return gridDim.x * blockDim.x;
}

__device__ int DeviceDefaultIndex() {
    return blockIdx.x * blockDim.x + threadIdx.x;
}

__global__ void KernelMemset(bool *p, int len, bool value) {
    int index = DeviceDefaultIndex();
    int step = DeviceDefaultStep();

    // Optimize loop by reducing branching and allowing more threads to work in parallel
    if (index < len) {
        for (int i = index; i < len; i += step) {
            p[i] = value;
        }
    }
}