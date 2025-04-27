#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grad(float *val, int *row_ind, int *col_ind, float *mat_err, int nnz, float *act, float *label, float *w, float learning_rate) {
    // Calculate the unique index for each thread
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread is within bounds
    if (tid < nnz) {
        // Cache accesses to global memory
        int r = row_ind[tid];
        int c = col_ind[tid];
        float v = val[tid];
        
        // Compute the error and update the weight
        float difference = label[r] - act[r];
        mat_err[tid] = abs(difference);
        float err = v * difference;
        atomicAdd(&w[c], learning_rate * err);
    }
}