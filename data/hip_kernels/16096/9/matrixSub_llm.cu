#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixSub(double *a, double *b, double *c, int cr, int cc) {
    // Calculate unique index for each thread
    long index = blockIdx.y * blockDim.y * cc + threadIdx.y * cc + blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread operates within matrix bounds
    if (index < cr * cc) {
        c[index] = a[index] - b[index];
    }
}