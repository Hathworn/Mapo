#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

__global__ void u8_to_f32(const unsigned char* x, float* y, unsigned int len) {
    const float scale = 1.0f / 255.0f;
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll loop for greater efficiency
    for (int i = tid; i < len; i += blockDim.x * gridDim.x) {
        y[i] = scale * x[i];
    }
}