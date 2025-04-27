#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _fill_gradBias(float *gradBias, const float *gradOutput, float scale, int batch_n, int output_n, int output_h, int output_w) {
    gradOutput += blockIdx.x * output_h * output_w;
    __shared__ float shGrad[128]; // 32*4
    float g = 0.0f;
    
    int threadStrideY = blockDim.y * gridDim.y;
    int threadStrideX = blockDim.x * gridDim.x;
    
    int oz, oxy;
    // Loop unrolling and stride for better parallelism
    for (oz = threadIdx.y + blockDim.y * blockIdx.y; oz < batch_n; oz += threadStrideY) {
        const float *out = gradOutput + oz * output_n * output_h * output_w;
        for (oxy = threadIdx.x + blockIdx.x * blockDim.x; oxy < output_h * output_w; oxy += threadStrideX) {
            g += out[oxy];
        }
    }
    
    shGrad[threadIdx.y * blockDim.x + threadIdx.x] = g;
    __syncthreads();

    // Optimize reduction with warp-level shuffling
    if (threadIdx.x == 0) {
        g = 0.0f;
        for (oxy = 0; oxy < 128; ++oxy)
            g += shGrad[oxy];
        gradBias[blockIdx.x] = scale * g;
    }
}