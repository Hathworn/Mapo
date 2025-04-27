#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _ele_add(float *m, float *target, float val, int len) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop for better global memory access pattern
    for (int i = tid; i < len; i += gridDim.x * blockDim.x) {
        target[i] = val + m[i];
    }
}