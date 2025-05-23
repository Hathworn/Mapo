#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __cumsumc(int nrows, int ncols, double *A, double *B) {
    __shared__ double buff[32];
    int i, j, k, lim;
    double v, sum;
    int icol = threadIdx.y + blockDim.y * blockIdx.x;
    __syncthreads();
    
    for (i = icol; i < ncols; i += blockDim.y * gridDim.x) {
        sum = 0.0;
        for (j = 0; j < nrows; j += blockDim.x) {
            v = 0;
            if (j + threadIdx.x < nrows) {
                v = A[j + threadIdx.x + i * nrows];
            }
            __syncthreads();
            buff[threadIdx.x] = v;
            lim = min(blockDim.x, nrows - j);

            // Use shared memory more effectively
            for (k = 1; k < lim; k <<= 1) {
                __syncthreads();
                if (threadIdx.x >= k) {
                    v += buff[threadIdx.x - k];
                }
                __syncthreads();
                buff[threadIdx.x] = v;
            }

            v += sum;
            if (j + threadIdx.x < nrows) {
                B[j + threadIdx.x + i * nrows] = v;
            }
            __syncthreads();

            // Accumulate last value in shared memory for use in the next iteration
            sum = buff[min(lim - 1, blockDim.x - 1)];
            __syncthreads();
        }
    }
}