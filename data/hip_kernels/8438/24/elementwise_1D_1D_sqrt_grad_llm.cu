#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_sqrt_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unrolling the loop to improve performance
    for (; tid < size; tid += stride) {
        if (tid < size) {
            float temp = out_d[tid] / out_x[tid] / 2; // Reduce redundant computations
            in_d[tid] += temp;
        }

        // Process the next element if within bounds
        if ((tid + stride) < size) {
            float next_tid = tid + stride;
            temp = out_d[next_tid] / out_x[next_tid] / 2; // Reduce redundant computations
            in_d[next_tid] += temp;
        }
    }
}