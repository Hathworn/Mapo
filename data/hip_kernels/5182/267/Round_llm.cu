#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Round(float * A, float * out, int size) {
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    if (id < size) {
        out[id] = roundf(out[id]);  // Use roundf for potential better precision and performance.
    }
}