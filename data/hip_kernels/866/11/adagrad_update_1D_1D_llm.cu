#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void adagrad_update_1D_1D(float* x, float* d, float* m, float clip, float lr, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Optimize: Use shared memory for accessing "clip" and "lr"
    __shared__ float sharedClip, sharedLr;
    if (threadIdx.x == 0) {
        sharedClip = clip;
        sharedLr = lr;
    }
    __syncthreads();

    for (; tid < size; tid += stride) {
        // Use sharedClip and sharedLr instead of global memory access
        if (d[tid] > sharedClip) d[tid] = sharedClip;
        if (d[tid] < -sharedClip) d[tid] = -sharedClip;
        m[tid] += d[tid] * d[tid];
        x[tid] -= sharedLr * d[tid] / sqrt(m[tid] + 0.00000001);
        d[tid] = 0;
    }
}