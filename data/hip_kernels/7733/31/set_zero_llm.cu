#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_zero(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds just once for performance
    if (x < nn && y < nn && x != i && y == i) {
        // Directly set A[x*nn + y] to zero when conditions are met
        A[x * nn + y] = 0;
    }
}