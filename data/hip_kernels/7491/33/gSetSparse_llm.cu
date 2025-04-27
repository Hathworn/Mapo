#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gSetSparse(float* out, const size_t* indices, const float* values, int length) {
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a single loop, thread processes its own data
    if(index < length) {
        out[indices[index]] = values[index];
    }
}