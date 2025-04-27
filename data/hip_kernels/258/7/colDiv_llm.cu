#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colDiv(float* a, float* b, float* c, int M, int N) {
    // Improved index calculation and boundary check
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < M && j < N) {
        int ind = i + j * M;
        c[ind] = a[ind] / b[i];
    }
}