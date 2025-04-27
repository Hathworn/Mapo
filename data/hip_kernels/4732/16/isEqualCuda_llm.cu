#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void isEqualCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint32_t width, uint32_t height, uint32_t * isEqual )
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory for intermediate results to reduce atomic operations
    __shared__ uint32_t sharedIsEqual;

    if (threadIdx.x == 0 && threadIdx.y == 0) {
        sharedIsEqual = 1; // Initialize shared memory
    }
    __syncthreads();

    if ( x < width && y < height ) {
        // Check equality and reduce directly in shared memory
        if(in1[y * rowSizeIn1 + x] != in2[y * rowSizeIn2 + x]) {
            atomicAnd(&sharedIsEqual, 0);
        }
    }

    __syncthreads();

    // Use block-level reduction to minimize global memory atomic operations
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        atomicAnd(isEqual, sharedIsEqual);
    }
}