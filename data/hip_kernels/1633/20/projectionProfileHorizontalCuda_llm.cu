#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileHorizontalCuda( const uint8_t * image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * projection )
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure block-level atomic operations using shared memory
    __shared__ uint32_t shared_projection[1024]; // Assuming max blockDim.x of 1024
    if (threadIdx.y == 0)
        shared_projection[threadIdx.x] = 0;
    __syncthreads();

    if (x < width && y < height) {
        const uint8_t * imageX = image + y * rowSize + x;
        atomicAdd(&shared_projection[threadIdx.x], (*imageX));
    }
    __syncthreads();

    // Global atomic add only by the first thread in each block
    if (threadIdx.y == 0)
        atomicAdd(&projection[x], shared_projection[threadIdx.x]);
}