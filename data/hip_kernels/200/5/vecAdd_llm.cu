#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAdd(float * in1, float * in2, float * out, int len) {
    // Efficiently calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within array bounds
    if (i < len) {
        // Perform vector addition
        out[i] = in1[i] + in2[i];
    }
}