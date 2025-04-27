#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void multScalar(float* in, float* out, float mult, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Minimize branch by removing condition from the loop
    while (tid < size) {
        out[tid] = in[tid] * mult;
        tid += stride;
    }
}