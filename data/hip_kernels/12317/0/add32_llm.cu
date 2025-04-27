#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
__global__ void add32(float* A, float *B, int size) {
    // Use simple 1D grid-stride loop for better performance and easier readability
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < size; i += stride) {
        A[i] = A[i] + B[i];
    }
}