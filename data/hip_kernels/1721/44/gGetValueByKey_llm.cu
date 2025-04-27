#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGetValueByKey(float* d_in, float* d_out, int* indeces, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread is within bounds
    if (tid >= n) return;

    // Read index once to minimize global memory accesses
    int index = indeces[tid];

    // Perform the assignment
    d_out[tid] = d_in[index];
}