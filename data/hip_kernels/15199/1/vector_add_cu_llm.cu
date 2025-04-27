#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_add_cu(float *out, float *a, float *b, int n) {
    // Calculate global index using block and thread indices
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure no excess iterations by checking index against n
    if (index < n) {
        out[index] = a[index] + b[index];
    }
}