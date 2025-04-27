#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gGetValueByKey(float* d_in, float* d_out, int* indeces, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    if(tid < n) {
        d_out[tid] = d_in[indeces[tid]]; // Direct access to memory using computed index
    }
}