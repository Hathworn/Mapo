#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void nllLoss(float *x, int x_stride, float *y, int* target) {
    // Calculate the unique thread ID
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    // Calculate the offset for input data
    int offset = tid * x_stride + target[tid];

    // Avoid out-of-bounds memory access
    if (tid < gridDim.x * blockDim.x) {
        y[tid] = -1.0f * x[offset]; // Use float literal for multiplication
    }
}