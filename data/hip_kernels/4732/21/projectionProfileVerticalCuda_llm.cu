#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void projectionProfileVerticalCuda(const uint8_t * image, uint32_t rowSize, uint32_t width, uint32_t height, uint32_t * projection)
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Use shared memory for efficient atomic operations
    __shared__ uint32_t sharedProjection[1024]; // Adjust size according to maximum number of threads per block
    if (y < height) {
        sharedProjection[threadIdx.y] = 0; // Initialize shared projection for each thread within the block
    }
    __syncthreads(); // Synchronize to ensure initialization is complete
    
    if (x < width && y < height) {
        const uint8_t * imageY = image + y * rowSize + x;
        atomicAdd(&sharedProjection[threadIdx.y], (*imageY)); // Accumulate in shared memory
    }
    __syncthreads(); // Synchronize to ensure all operations are complete before writing to global memory
    
    if (y < height) {
        atomicAdd(&projection[y], sharedProjection[threadIdx.y]); // Commit to global memory
    }
}