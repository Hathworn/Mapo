#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_mul(float* in1, float* in2, float* out, int size) {
    // Calculate thread ID and stride
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use a loop to cover the entire array
    for (int i = tid; i < size; i += stride) {
        out[i] = in1[i] * in2[i]; // Perform element-wise multiplication
    }
}