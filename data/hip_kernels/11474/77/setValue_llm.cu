#include "hip/hip_runtime.h"
#include "includes.h"

// Use blockIdx.x and blockDim.x to determine a unique thread
__global__ void setValue(float *data, int idx, float value) {
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique global thread index

    // Ensure only a single thread performs the write operation to prevent race conditions
    if(globalIdx == 0) {
        data[idx] = value;  // Write the value at the specified index
    }
}