#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k1_incr(float *data, float val) {
    // Calculate the global thread id
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use global thread id to enable processing of larger arrays
    data[idx] += val;
}