#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetBufferToRandom(float* buffer, float min, float max, int size) {
    int offset = CUDASTDOFFSET;

    // Initialize local state for the current thread
    hiprandState localState;
    hiprand_init(7 + offset, offset, 0, &localState);

    // Ensure all threads have initialized their state before proceeding
    __syncthreads();

    // Check if offset is within bounds before computing random value
    if (offset < size) {
        // Generate random value only for valid offsets
        float value = min + (max - min) * hiprand_uniform(&localState);
        buffer[offset] = value;
    }
}