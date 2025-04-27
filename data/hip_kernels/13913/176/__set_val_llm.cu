#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __set_val(float *A, float val, int length) {
    int ip = threadIdx.x + blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y);
    int stride = blockDim.x * gridDim.x * gridDim.y; // Calculate stride outside loop
    for (int i = ip; i < length; i += stride) { // Use pre-calculated stride
        A[i] = val;
    }
}