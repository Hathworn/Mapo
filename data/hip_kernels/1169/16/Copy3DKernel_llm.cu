#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Copy3DKernel (const unsigned short *d_src, float *d_dst, float min_intensity, const int width, const int height, const int depth) {
    // Calculate global index for current thread
    const int baseX = blockIdx.x * blockDim.x + threadIdx.x;
    const int baseY = blockIdx.y * blockDim.y + threadIdx.y;
    const int baseZ = blockIdx.z * blockDim.z + threadIdx.z;

    // Return if thread is out of bounds
    if (baseX >= width || baseY >= height || baseZ >= depth) return;

    // Calculate 1D index in the 3D array
    const int idx = (baseZ * height + baseY) * width + baseX;

    // Perform intensity check and value copy
    const float intensity = (float)d_src[idx];
    d_dst[idx] = (intensity >= min_intensity) ? intensity : 0;
}