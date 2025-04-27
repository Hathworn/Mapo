#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isEqualCuda( const uint8_t * in1, uint32_t rowSizeIn1, const uint8_t * in2, uint32_t rowSizeIn2, uint32_t width, uint32_t height, uint32_t * isEqual )
{
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Early exit for threads outside the bounds
    if (x >= width || y >= height) return;

    const uint32_t partsEqual = static_cast<uint32_t>( in1[y * rowSizeIn1 + x] == in2[y * rowSizeIn2 + x] );
    
    // Use shared memory to aggregate results within a block
    __shared__ uint32_t sharedEqual[32]; // Assuming warp size is 32
    sharedEqual[threadIdx.x] = partsEqual;

    __syncthreads();

    // Reduction within the block
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        if (threadIdx.x < offset) {
            sharedEqual[threadIdx.x] &= sharedEqual[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Only one thread per block performs atomic operation
    if (threadIdx.x == 0) {
        atomicAnd(isEqual, sharedEqual[0]);
    }
}