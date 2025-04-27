#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertKinectDisparityInPlace_kernel(float *d_disparity, int pitch, int width, int height, float depth_scale) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= width || y >= height) return; // Exit early if out of bounds

    float *d_in = (float *)((char *)d_disparity + y * pitch) + x;
    float value = *d_in;
    *d_in = (value == 0.0f) ? nanf("") : (-depth_scale / value); // Precompute value and remove redundant check
}