#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gSetSparse(float* out, const size_t* indices, const float* values, int length) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within the length
    if (index < length) {
        // Directly store value using calculated index
        out[indices[index]] = values[index];
    }
}