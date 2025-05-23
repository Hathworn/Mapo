#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_minus(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use only necessary check before accessing memory
    if (tid < size) {
        // Avoid unnecessary index calculation in the loop by unrolling
        out[tid] = in1[tid] - in2[tid];
        tid += stride;
    }
}