#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_regularize_kernel(int factors, float regularization, float * YtY) {
    int idx = threadIdx.x;
    // Coalesced memory access for better performance
    YtY[idx * factors + idx] += regularization; 
}