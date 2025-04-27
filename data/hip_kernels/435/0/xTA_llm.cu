#include "hip/hip_runtime.h"
#include "includes.h"
#define THREADS_PER_BLOCK 512

__global__ void xTA(double *y, int k, double *A, int m, int lda, double *x, int ldx) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < k) {
        double s = 0.0; // Initialize sum to 0
        for (int ii = 0; ii < m; ii++) {
            s += x[ii * ldx] * A[idx + ii * lda];
        }
        y[idx] = s; // Update result vector 
    }
}