#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileVerticalCuda(const uint8_t * image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * projection)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory to reduce global memory access
    __shared__ uint32_t localProjection[1024];

    if (threadIdx.y == 0 && x < width)
        localProjection[threadIdx.x] = 0;

    __syncthreads();

    if (x < width && y < height) {
        const uint8_t *imageY = image + y * rowSize + x;
        atomicAdd(&localProjection[threadIdx.x], (*imageY));
    }

    __syncthreads();

    // Write back to global memory
    if (threadIdx.y == 0 && x < width) {
        atomicAdd(&projection[x], localProjection[threadIdx.x]);
    }
}