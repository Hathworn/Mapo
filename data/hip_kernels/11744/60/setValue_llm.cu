#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setValue(float *data, int idx, float value) {
    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x; // Calculate global index
    if (globalIdx == idx) { // Check if current thread corresponds to the target index
        data[globalIdx] = value; // Set value
    }
}