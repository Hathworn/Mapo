#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void extractParam(const int d, const int n, const int Indx, const float *s, float *a) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride
    while (i < n) { // Use a loop for kernel efficiency
        a[i] = s[Indx + i * d];
        i += stride; // Jump by grid stride
    }
}