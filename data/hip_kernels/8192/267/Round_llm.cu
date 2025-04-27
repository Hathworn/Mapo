#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Round(float * A, float *out, int size) {
    int id = blockDim.x * gridDim.x * blockIdx.y + blockDim.x * blockIdx.x + threadIdx.x;

    if (id < size) {
        // Use built-in rintf function for rounding
        out[id] = rintf(out[id]);
    }
}