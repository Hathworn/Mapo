#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tanh_f32(float* vector, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        float tmp = vector[idx];
        // Use intrinsic function for faster computation
        output[idx] = __fdividef(tmp, 1.0f + fabsf(tmp));
    }
}