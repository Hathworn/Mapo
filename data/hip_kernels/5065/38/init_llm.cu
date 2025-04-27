#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

__global__ void init(double* A, double* V, double* VN, int size, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= size) return;

    double s = 0.0;
    int stride = n; // Pre-calculate stride to improve readability
    int index = i * stride; // Pre-compute base index for row
    for (int j = 0; j < n; j++) {
        s += A[index + j] * V[j]; // Use pre-computed index
    }
    VN[i] = s;
}