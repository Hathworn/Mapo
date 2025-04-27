#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bit_reduce_count(const uint32_t *input_array, uint32_t *intBuf, uint32_t *countBuf, const uint16_t dataCount) {
    extern __shared__ uint32_t sharedMem[];

    const uint32_t i = threadIdx.x + blockDim.x * blockIdx.x;
    const uint32_t a = (i < dataCount) ? input_array[i] : 0; // Ensure within bounds
    uint8_t size = 0;

    // Determine the size using a streamlined conditional
    size = (a <= 0xff) ? 1 : (a <= 0xffff) ? sizeof(uint16_t) : sizeof(uint32_t);

    sharedMem[threadIdx.x] = size;
    __syncthreads();

    // Use one thread to compute the prefix sums in shared memory
    if (threadIdx.x == 0) {
        uint32_t total = 0;
        for (uint16_t j = 0; j < blockDim.x && j < dataCount - blockDim.x * blockIdx.x; j++) { // Boundary check
            total += sharedMem[j];
            sharedMem[j] = total;
        }
        countBuf[blockIdx.x] = total;
    }
    __syncthreads();

    // Simplify writeindex calculation and ensure alignment
    uint8_t* writeindex = (threadIdx.x > 0 ? sharedMem[threadIdx.x - 1] : 0) + ((uint8_t*)&intBuf[blockDim.x * blockIdx.x]);
    
    // Reduce branching by setting the value and using one memcpy call
    *writeindex = size;
    memcpy(writeindex+1, &a, size); // Use the determined size
}