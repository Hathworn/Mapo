#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void times_scalard(double *v, double other, int n) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    // Use a stride loop to process elements
    for (int i = x; i < n; i += blockDim.x * gridDim.x) {
        v[i] *= other;
    }
}