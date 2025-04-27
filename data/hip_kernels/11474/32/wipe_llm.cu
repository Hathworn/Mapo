#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wipe(int *buffer, int length) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Global index for threads
    int stride = blockDim.x * gridDim.x; // Grid-stride loop increment
    length >>= 5;

    for(int i = index; i < length; i += stride) {
        buffer[(i << 5) + threadIdx.x] = -1; // Set buffer value to -1
    }
}