#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_zero(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Use a single if condition to minimize branch divergence
    if (x < nn && y == i && x != i) {
        A[x * nn + y] = 0;
    }
}