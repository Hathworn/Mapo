#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void aypb_f32 (float a, float* y, float b, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll loop to improve computational efficiency
    int stride = blockDim.x * gridDim.x;
    for (int i = idx; i < len; i += stride) {
        y[i] = a * y[i] + b;
    }
}