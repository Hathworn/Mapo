#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_mul_mutate(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll loop for better performance
    for (; tid < size; tid += stride) {
        out[tid] += in1[tid] * in2[tid];
        if (tid + stride < size) {
            out[tid + stride] += in1[tid + stride] * in2[tid + stride];
        }
    }
}