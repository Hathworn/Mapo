#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileHorizontalCuda(const uint8_t * image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * projection) {
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory to reduce atomic operations
    __shared__ uint32_t sharedProjection[256]; // Adjust size as necessary (e.g., equal to blockDim.x)
    if (threadIdx.y == 0) {
        sharedProjection[threadIdx.x] = 0;
    }
    __syncthreads();

    if (x < width && y < height) {
        const uint8_t * imageX = image + y * rowSize + x;
        atomicAdd(&sharedProjection[threadIdx.x], (*imageX));
    }
    __syncthreads();

    if (threadIdx.y == 0) {
        atomicAdd(&projection[x], sharedProjection[threadIdx.x]);
    }
}