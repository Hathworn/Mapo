#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void projectionProfileHorizontalCuda(const uint8_t *image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *projection)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockIdx.y;  // Use a single thread per row for better warp utilization

    if (x < width && y < height) {
        const uint8_t *imageRow = image + y * rowSize;  // Pre-compute row start to reduce index calculation
        atomicAdd(&projection[x], imageRow[x]);
    }
}