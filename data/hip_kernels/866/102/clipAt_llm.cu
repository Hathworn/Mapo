```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void clipAt(float* in, float bound, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use loop unrolling to reduce branch divergence.
    for (; tid < size; tid += stride * 2) {
        if (tid < size) {
            float val = in[tid];
            in[tid] = (val > bound) ? bound : (val < -bound) ? -bound : val;
        }

        int next_tid = tid + stride;
        if (next_tid < size) {
            float next_val = in[next_tid];
            in[next_tid] = (next_val > bound) ? bound : (next_val < -bound) ? -bound : next_val;
        }
    }
}