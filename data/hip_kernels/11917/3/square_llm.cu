#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(float * d_out, float * d_in) {
    // Calculate global thread index using faster multiplication
    unsigned int gid = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Use direct memory access without additional variable
    d_out[gid] = d_in[gid] * d_in[gid];
}