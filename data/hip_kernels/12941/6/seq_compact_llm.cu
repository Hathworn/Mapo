#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void seq_compact(uint8_t *intBuf, const uint16_t dataSize, uint32_t *sizeBuf) {
    // Use shared memory to reduce global memory access latency
    __shared__ uint8_t sharedIntBuf[1024];
    
    uint16_t writeIndex = 0;
    
    for (uint16_t i = threadIdx.x; i < dataSize; i += blockDim.x) {
        // Use coalesced memory access to improve performance
        const uint16_t readIndex = i * 4;
        uint8_t size = intBuf[readIndex];
        
        // Copy to shared memory first to avoid repeated global memory access
        for (uint8_t j = 0; j <= size; ++j) {
            sharedIntBuf[writeIndex + j] = intBuf[readIndex + j];
        }
        
        writeIndex += size + 1;
    }

    // Copy data back to global memory
    for (uint16_t i = threadIdx.x; i < writeIndex; i += blockDim.x) {
        intBuf[i] = sharedIntBuf[i];
    }

    // Update sizeBuf with the final write index
    if (threadIdx.x == 0) {
        atomicMax(&sizeBuf[0], writeIndex);
    }

    // Zero out the rest of the buffer
    const uint32_t int_buf_size = (dataSize * sizeof(uint32_t)) + (dataSize * sizeof(uint8_t));
    if (threadIdx.x == 0) {
        memset(&intBuf[writeIndex], 0, int_buf_size - writeIndex);
    }
}