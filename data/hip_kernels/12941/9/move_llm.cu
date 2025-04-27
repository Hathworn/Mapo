#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void move(uint8_t *buf, uint32_t dest, uint32_t source, uint16_t bytesEach, const bool wipe) {
    extern __shared__ uint8_t sharedMemT[];
    const uint32_t i = threadIdx.x;
    uint8_t *src = &buf[source + i * bytesEach];
    uint8_t *d = &buf[dest + i * bytesEach];

    for (uint16_t j = 0; j < bytesEach; j++) {
        sharedMemT[i * bytesEach + j] = src[j];  // Read data from global to shared
        if (wipe) {
            src[j] = 0;  // Zero-out the source if wipe is true
        }
    }

    __syncthreads();

    for (uint16_t j = 0; j < bytesEach; j++) {
        d[j] = sharedMemT[i * bytesEach + j];  // Write data from shared to global
    }
}