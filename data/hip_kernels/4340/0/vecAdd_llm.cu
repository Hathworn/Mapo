#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(float * in1, float * in2, float * out, int len) {
    // Efficient vector addition by ensuring coalesced memory access
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < len) {
        out[i] = in1[i] + in2[i];
    }
}