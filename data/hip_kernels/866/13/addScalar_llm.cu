#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void addScalar(float* in, float* out, float add, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop unrolling for performance improvement
    for (; tid + 3 < size; tid += stride * 4) {
        out[tid] = in[tid] + add;
        out[tid + 1] = in[tid + 1] + add;
        out[tid + 2] = in[tid + 2] + add;
        out[tid + 3] = in[tid + 3] + add;
    }

    // Handle remaining elements
    for (; tid < size; tid += stride) {
        out[tid] = in[tid] + add;
    }
}