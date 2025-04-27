#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Sum(float *A, float *B, float *C, int size) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;   // Simplify thread index calculation
    int stride = blockDim.x * gridDim.x;               // Calculate stride for larger problems
    for (int id = idx; id < size; id += stride) {      // Loop for larger data sizes
        C[id] = A[id] + B[id];                         // Perform element-wise addition
    }
}