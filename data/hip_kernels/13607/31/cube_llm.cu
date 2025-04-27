#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cube(float *d_out, float *d_in) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global index
    float num = d_in[id];
    d_out[id] = num * num * num;
}