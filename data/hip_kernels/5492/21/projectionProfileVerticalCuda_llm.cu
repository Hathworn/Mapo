#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileVerticalCuda(const uint8_t *image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *projection)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory to reduce global memory access and atomic operations.
    __shared__ uint32_t sharedProjection[1024];

    if(threadIdx.x == 0 && y < height) {
        sharedProjection[y] = 0;
    }
    __syncthreads();

    if (x < width && y < height)
    {
        const uint8_t *imageY = image + y * rowSize + x;
        atomicAdd(&sharedProjection[y], (*imageY));
    }
    __syncthreads();

    if(threadIdx.x == 0 && y < height) {
        atomicAdd(&projection[y], sharedProjection[y]);
    }
}