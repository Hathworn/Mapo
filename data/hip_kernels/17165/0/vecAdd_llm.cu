#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd(double *a, double *b, double *c, int n) {
    // Use grid-stride loops for scalability
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    for (int i = id; i < n; i += blockDim.x * gridDim.x) {
        c[i] = a[i] + b[i];
    }
}