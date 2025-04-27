#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
    // Use blockIdx.x as index and ensure stride over gridDim.x for larger datasets
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        accuracy[idx] /= N;
    }
}