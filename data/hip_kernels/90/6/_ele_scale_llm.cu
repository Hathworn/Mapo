#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _ele_scale(float *m, float *target, float scaler, int len) {
    // Calculate thread's global index.
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Process multiple elements per thread to utilize all available threads effectively.
    for (int i = tid; i < len; i += blockDim.x * gridDim.x) {
        target[i] = scaler * m[i];
    }
}