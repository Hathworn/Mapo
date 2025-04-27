#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void elementwise_1D_1D_exp_grad(float* in_x, float* in_d, float* out_x, float * out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use blockDim.x for better access pattern and performance
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        in_d[i] += out_d[i] * out_x[i];
    }
}