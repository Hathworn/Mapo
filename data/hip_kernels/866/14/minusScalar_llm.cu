#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void minusScalar(float* in, float* out, float minus, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Unroll the loop for better performance
    for (; tid < size; tid += stride * 4) {
        if (tid < size) out[tid] = in[tid] - minus;
        if (tid + stride < size) out[tid + stride] = in[tid + stride] - minus;
        if (tid + 2 * stride < size) out[tid + 2 * stride] = in[tid + 2 * stride] - minus;
        if (tid + 3 * stride < size) out[tid + 3 * stride] = in[tid + 3 * stride] - minus;
    }
}