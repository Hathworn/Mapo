#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyVariable(double *var_in, double *var_out, int size) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Pre-compute stride for optimization
    for (int i = tid; i < size; i += stride) { // Use for-loop instead of while for potential unrolling
        var_out[i] = var_in[i];
    }
}