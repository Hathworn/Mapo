#include "hip/hip_runtime.h"
#include "includes.h"

#define N 10000000
#define MAX_ERR 1e-6

__global__ void vector_add(float *out, float *a, float *b, int n) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;  // Calculate global thread index
    int stride = blockDim.x * gridDim.x;                // Calculate total stride across all blocks

    for(int i = index; i < n; i += stride){
        out[i] = a[i] + b[i];
    }
}