#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileHorizontalCuda(const uint8_t *image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t *projection) 
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    if (x < width && y < height) {
        const uint8_t pixelValue = image[y * rowSize + x];
        // Use shared memory to reduce atomic operations
        __shared__ uint32_t partialSum[1024]; // Adjust size according to blockDim.x
        uint32_t tid = threadIdx.y * blockDim.x + threadIdx.x;
        partialSum[tid] = static_cast<uint32_t>(pixelValue);

        __syncthreads();

        // Reduce within block
        for (uint32_t stride = blockDim.y / 2; stride > 0; stride /= 2) {
            if (threadIdx.y < stride) {
                partialSum[tid] += partialSum[tid + stride * blockDim.x];
            }
            __syncthreads();
        }

        // One thread writes the result for each column to global memory
        if (threadIdx.y == 0) {
            atomicAdd(&projection[x], partialSum[threadIdx.x]);
        }
    }
}