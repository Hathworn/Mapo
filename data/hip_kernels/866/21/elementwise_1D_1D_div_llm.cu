#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_div(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use while loop for clarity and ensure stride coverage
    while (tid < size) {
        out[tid] = in1[tid] / in2[tid];  // Perform element-wise division
        tid += stride;
    }
}