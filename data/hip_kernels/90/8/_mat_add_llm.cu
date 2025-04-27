#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _mat_add(float *ma, float *mb, float *target, float sa, float sb, int len) {
    // Calculate the global thread ID for indexing
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Process multiple elements per thread for coalesced access and less divergence
    int stride = blockDim.x * gridDim.x; 
    for (int i = tid; i < len; i += stride) {
        target[i] = sa * ma[i] + sb * mb[i];
    }
}