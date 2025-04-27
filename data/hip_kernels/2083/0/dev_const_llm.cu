#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dev_const(float *px, float k) {
    // Use the total number of threads and stride to handle larger data sizes
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = idx; i < stride; i += stride) {
        px[i] = k;  // Efficient memory access using for loop
    }
}