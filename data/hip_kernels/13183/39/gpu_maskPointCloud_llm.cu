#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_maskPointCloud(float4* verts, const int width, const int height, const int* mask) {
    // Use 2D index calculation instead of separate x, y variables
    const int index = blockIdx.x * blockDim.x + threadIdx.x 
                    + (blockIdx.y * blockDim.y + threadIdx.y) * width;

    if (index >= width * height) return;

    // Avoid branch divergence with ternary operator
    verts[index].w = (mask[index] == 0) ? -1 : verts[index].w;
}