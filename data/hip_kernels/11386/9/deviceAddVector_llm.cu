#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deviceAddVector(int *d_a, int *d_b, int *d_c, int size) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform check and vector addition
    if (i < size) {
        d_c[i] = d_a[i] + d_b[i];
    }
}