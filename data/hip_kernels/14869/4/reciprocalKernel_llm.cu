#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    // Compute global thread index
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if the index is within bounds and update the data
    if (idx < vectorSize) {
        data[idx] = __fdiv_rd(1.0f, data[idx]); // Use fast division intrinsic
    }
}