#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

const double TOLERANCE = 1.0e-10;

/*
cgsolver with CUDA support solves the linear equation A*x = b where A is of size m x n
*/

__global__ void mvm_gpu(double *A_cuda, double *X_cuda, double *Y_cuda, int *m_locals_cuda, int *A_all_pos_cuda, int n, int nthreads) {
    int t = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (t < nthreads) {
        int startIdx = A_all_pos_cuda[t];
        int endIdx = startIdx + m_locals_cuda[t];
        
        // Pre-calculate the stride outside the inner loop
        for (int i = startIdx; i < endIdx; ++i) {
            double sum = 0.0;  // Use a local variable to accumulate the result
            for (int j = 0; j < n; ++j) {
                sum += A_cuda[i * n + j] * X_cuda[j];  // Accumulate sum
            }
            Y_cuda[i] = sum;  // Store the result
        }
    }
}