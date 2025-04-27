#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_sqrt(float* in, float* out, int size) {
    // Cache the block and thread size 
    const int tid = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x;

    // Use stride and loop unrolling to reduce overhead
    for (int i = tid; i < size; i += stride) {
        out[i] = sqrt(in[i]);
    }
}