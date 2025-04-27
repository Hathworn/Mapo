#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gSetSparse(float* out, const size_t* indices, const float* values, int length) {
    // Calculate the unique global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Iterate over all elements this thread is responsible for
    for(int i = index; i < length; i += blockDim.x * gridDim.x) {
        // Perform the sparse setting
        out[indices[i]] = values[i];
    }
}