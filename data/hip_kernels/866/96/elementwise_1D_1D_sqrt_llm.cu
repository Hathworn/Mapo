#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_sqrt(float* in, float* out, int size) {
    // Calculate thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Iterate over the elements using stride
    int stride = blockDim.x * gridDim.x;
    while (tid < size) {
        // Perform square root operation
        out[tid] = sqrtf(in[tid]);
        
        // Move to the next element in stride
        tid += stride;
    }
}