#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixSubScalar(double *a, double b, double *c, int cr, int cc){

    int idx = blockIdx.y * blockDim.y * cc + blockIdx.x * blockDim.x; // Calculate starting index
    int thread_id = threadIdx.y * blockDim.x + threadIdx.x; // Flatten thread index
    int x = idx + thread_id; // Overall 1D indexing

    if (x < cr * cc) { // Check within bounds for flattened index
        c[x] = a[x] - b; // Simplified the subtraction operation
    }

}