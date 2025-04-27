#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_sqrt_grad(float* in_x, float* in_d, float* out_x, float * out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Improved the loop condition to remove unnecessary check
    int stride = gridDim.x * blockDim.x;

    while (tid < size) {
        in_d[tid] += out_d[tid] / out_x[tid] / 2;
        tid += stride; // Increment tid with stride inside the loop to prevent multiple calculations
    }
}