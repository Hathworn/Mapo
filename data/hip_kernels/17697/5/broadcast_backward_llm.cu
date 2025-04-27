#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void broadcast_backward(float* dx, const float* dy, unsigned int c, unsigned int len) {
    // Calculate the global thread index
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Iterate over the necessary elements using stride
    for (unsigned int i = tid; i < len; i += blockDim.x * gridDim.x) {
        atomicAdd(&dx[i % c], dy[i]); // Efficient atomicAdd operation
    }
}