#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diag_normalize(double *A, double *I, int n, int i) {
    // Compute the unique thread index within the grid
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Only one thread needs to perform the operation
    if (tid == i && tid < n) { 
        double diag = A[i * n + i];
        if (diag != 0) {  // Ensure we're not dividing by zero
            I[tid * n + tid] /= diag;
            A[tid * n + tid] /= diag;
        }
    }
}