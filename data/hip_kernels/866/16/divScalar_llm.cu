#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void divScalar(float* __restrict__ in, float* __restrict__ out, float div, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Use loop unrolling for performance improvement
    for (; tid < size; tid += stride * 4) {
        if (tid < size) out[tid] = in[tid] / div;
        if (tid + stride < size) out[tid + stride] = in[tid + stride] / div;
        if (tid + 2 * stride < size) out[tid + 2 * stride] = in[tid + 2 * stride] / div;
        if (tid + 3 * stride < size) out[tid + 3 * stride] = in[tid + 3 * stride] / div;
    }
}