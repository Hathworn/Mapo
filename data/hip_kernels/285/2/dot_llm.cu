#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot(float * val, int *row_ind, int *col_ind, int nnz, float * ret, float * w) {
    // Calculate unique global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride loop to handle larger data sets more efficiently
    for (int index = tid; index < nnz; index += blockDim.x * gridDim.x) {
        int r = row_ind[index];
        int c = col_ind[index];
        float v = val[index];
        atomicAdd(&ret[r], v * w[c]);
    }
}