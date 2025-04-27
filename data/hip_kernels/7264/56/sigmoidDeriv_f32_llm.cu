#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sigmoidDeriv_f32 (float* vector, float* output, int len) {
    // Use a grid-wide stride loop for improved memory access pattern
    for (int idx = blockIdx.x * blockDim.x + threadIdx.x; idx < len; idx += gridDim.x * blockDim.x) {
        float val = vector[idx];
        float tmp = 1.0f + fabsf(val);  // Utilize the device function for absolute value
        output[idx] = -0.5f / (tmp * tmp); // Simplified computation
    }
}