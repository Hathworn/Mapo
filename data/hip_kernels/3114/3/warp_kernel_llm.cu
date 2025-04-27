#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warp_kernel(float* out, const float* in, const int* index, const float* weights, const int npixels, const int nchannels) {
    // Calculate linear index for pixel and channel
    int pixel = blockIdx.x * blockDim.x + threadIdx.x;
    int channel = blockIdx.y * blockDim.y + threadIdx.y;

    // Boundary check
    if (channel < nchannels && pixel < npixels) {
        // Optimize memory access and calculations
        int pixelOffset = 4 * pixel;
        int outOffset = nchannels * pixel + channel;
        float result = 0.0f;
        #pragma unroll 4 // Unroll loop for performance
        for (int i = 0; i < 4; ++i) {
            int inOffset = nchannels * index[pixelOffset + i] + channel;
            result += in[inOffset] * weights[pixelOffset + i];
        }
        out[outOffset] = result;
    }
}