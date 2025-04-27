#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixClip(double *a, double min, double max, double *c, int cr, int cc) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    if (x < cc && y < cr) {
        double val = a[y * cc + x]; // Load value once
        c[y * cc + x] = (val > max) ? max : ((val < min) ? min : val); // Simplified conditional
    }
}