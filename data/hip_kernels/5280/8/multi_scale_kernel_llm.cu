#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multi_scale_kernel(const float *data_in, const float *scale, float *data_out, int width, int height) {
    // Calculate single index for thread
    int index = blockDim.x * blockIdx.x + threadIdx.x + (blockDim.y * blockIdx.y + threadIdx.y) * width;
    
    // Boundary check
    if (index < width * height) {
        int y = index / width; // Calculate y-coordinate
        data_out[index] = data_in[index] * scale[y];
    }
}