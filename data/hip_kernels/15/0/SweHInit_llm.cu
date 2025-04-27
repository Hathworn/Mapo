#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SweHInit(double *var_in1, double *var_in2, double *var_out, int size) {
    // Calculate thread id
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Optimize loop by checking boundary condition first
    if (tid < size) {
        var_out[tid] = var_in1[tid] - var_in2[tid];
        
        // Loop through remaining elements using stride to avoid excess if check
        for (int i = tid + blockDim.x * gridDim.x; i < size; i += blockDim.x * gridDim.x) {
            var_out[i] = var_in1[i] - var_in2[i];
        }
    }
}