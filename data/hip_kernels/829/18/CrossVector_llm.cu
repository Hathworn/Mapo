#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CrossVector(float *first , float *second) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (idx < N) { // Ensure index is within bounds
        // Use fast intrinsic sqrt function for better performance
        first[idx] *= __fsqrt_rn(second[idx]);
    }
}