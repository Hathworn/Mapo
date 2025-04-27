#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gAddRow(float* out, const float* in, int length) {
    // Use blockIdx.x and gridDim.x to evenly distribute the workload across blocks
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index does not exceed the length
    if(index < length) {
        out[index] += in[index];
    }
}