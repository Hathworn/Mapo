#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Normalize3DKernel (const unsigned short *d_src, const float *d_erosion, const float *d_dilation, float *d_dst, float min_intensity, const int width, const int height, const int depth) {
    // Calculate the 3D index
    const int baseX = blockIdx.x * blockDim.x + threadIdx.x;
    const int baseY = blockIdx.y * blockDim.y + threadIdx.y;
    const int baseZ = blockIdx.z * blockDim.z + threadIdx.z;

    // bounds check
    if (baseX >= width || baseY >= height || baseZ >= depth) return;

    // Compute linear index
    const int idx = (baseZ * height + baseY) * width + baseX;
    const float intensity = static_cast<float>(d_src[idx]);

    // Normalize if intensity is above threshold
    d_dst[idx] = (intensity >= min_intensity) ? (intensity - d_erosion[idx]) / (d_dilation[idx] - d_erosion[idx]) : 0.0f;
}