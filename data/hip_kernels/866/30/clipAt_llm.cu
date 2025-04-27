#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void clipAt(float* in, float bound, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll loop to reduce iterations and improve performance
    for (int i = tid; i < size; i += stride * 4) {
        if (i < size) {
            if (in[i] > bound) in[i] = bound;
            if (in[i] < -bound) in[i] = -bound;
        }
        if (i + stride < size) {
            if (in[i + stride] > bound) in[i + stride] = bound;
            if (in[i + stride] < -bound) in[i + stride] = -bound;
        }
        if (i + stride * 2 < size) {
            if (in[i + stride * 2] > bound) in[i + stride * 2] = bound;
            if (in[i + stride * 2] < -bound) in[i + stride * 2] = -bound;
        }
        if (i + stride * 3 < size) {
            if (in[i + stride * 3] > bound) in[i + stride * 3] = bound;
            if (in[i + stride * 3] < -bound) in[i + stride * 3] = -bound;
        }
    }
}