#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expandKernel(double* values, int n_original, int factor, double* expanded){
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    // Precompute division as integer for efficiency
    for (; tid < n_original * factor; tid += stride){
        int idx = tid / factor;  // Use integer division
        expanded[tid] = values[idx];  
    }
}