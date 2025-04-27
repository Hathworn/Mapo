#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_log(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop through increments of stride starting at tid
    for (int idx = tid; idx < size; idx += stride) {
        out[idx] = logf(in[idx]); // Use logf for single precision
    }
}