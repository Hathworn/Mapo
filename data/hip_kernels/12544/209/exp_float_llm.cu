#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void exp_float(int n,int idx,float *dy,int incy,float *result) {
    // Calculate the global thread index once
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Unroll loop to maximize parallelization
    for (; i < n; i += blockDim.x * gridDim.x) { 
        if(i >= idx && i % incy == 0)
            result[i] = sinf(dy[i]);
    }
}