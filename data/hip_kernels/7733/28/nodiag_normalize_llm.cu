#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nodiag_normalize(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure indices are within bounds and focus on row 'i' only when x == i
    if (x == i && y < nn && x != y) { 
        double reciprocal = 1.0 / A[i * nn + i]; // Cache reciprocal to minimize division operations
        I[x * nn + y] *= reciprocal;
        A[x * nn + y] *= reciprocal;
    }
}