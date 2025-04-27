#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void isEqualCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint32_t width, uint32_t height, uint32_t *isEqual) {
    const uint32_t x = blockDim.x * blockIdx.x + threadIdx.x;
    const uint32_t y = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory to reduce global memory access
    __shared__ uint32_t sharedEqual;

    if (threadIdx.x == 0 && threadIdx.y == 0) {
        sharedEqual = 1; // Initialize shared variable
    }
    __syncthreads();

    if (x < width && y < height) {
        // Directly compute and compare within bounds
        atomicAnd(&sharedEqual, static_cast<uint32_t>(in1[y * rowSizeIn1 + x] == in2[y * rowSizeIn2 + x]));
    }

    __syncthreads();
    
    // Write back result from shared memory to global memory
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        atomicAnd(isEqual, sharedEqual);
    }
}