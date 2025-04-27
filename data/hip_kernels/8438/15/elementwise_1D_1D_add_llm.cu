#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_add(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Unroll the loop to improve performance
    for (; tid < size; tid += stride * 4) {
        if (tid < size) out[tid] = in1[tid] + in2[tid];
        if (tid + stride < size) out[tid + stride] = in1[tid + stride] + in2[tid + stride];
        if (tid + 2 * stride < size) out[tid + 2 * stride] = in1[tid + 2 * stride] + in2[tid + 2 * stride];
        if (tid + 3 * stride < size) out[tid + 3 * stride] = in1[tid + 3 * stride] + in2[tid + 3 * stride];
    }
}