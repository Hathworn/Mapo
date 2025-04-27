#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float * in1, float * in2, float * out, int len) {
    // Obtain thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threads do not exceed vector length
    if (idx < len) {
        // Perform vector addition
        out[idx] = in1[idx] + in2[idx];
    }
}