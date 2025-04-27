#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeSubtract3DKernel(float *img_src, const float *img_sub, const int width, const int height, const int depth, float normalizer) {
    const int baseX = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for flexibility
    const int baseY = blockIdx.y * blockDim.y + threadIdx.y; // Use blockDim.y for flexibility
    const int baseZ = blockIdx.z * blockDim.z + threadIdx.z; // Use blockDim.z for flexibility

    if (baseX < width && baseY < height && baseZ < depth) { // Ensure indices are within bounds
        const int idx = (baseZ * height + baseY) * width + baseX;
        img_src[idx] = (img_src[idx] - img_sub[idx]) * normalizer;
    }
}