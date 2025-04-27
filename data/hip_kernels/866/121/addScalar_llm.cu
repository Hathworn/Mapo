#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addScalar(float* in, float* out, float add, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = tid; i < size; i += stride) { // Use local variable for loop control
        out[i] = in[i] + add; // Calculate and store result directly
    }
}