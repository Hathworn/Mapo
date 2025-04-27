#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CopyVariable(double *var_in, double *var_out, int size) {
    // Calculate the global thread ID
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use stride loop for better occupancy
    int stride = blockDim.x * gridDim.x;
    for (int i = tid; i < size; i += stride) {
        var_out[i] = var_in[i];
    }
}