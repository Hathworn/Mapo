#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel for parallel computation
__global__ void multiplyDet(double *matrix, double *determinant, int *n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int nn = *n;

    if (tid < nn) {
        // Use shared memory to accumulate partial products
        __shared__ double partialDet[1024];
        partialDet[tid] = matrix[tid * nn + tid];
        __syncthreads();

        // Use reduction to compute the determinant
        for (int stride = 1; stride < nn; stride *= 2) {
            if (tid % (2 * stride) == 0 && tid + stride < nn) {
                partialDet[tid] *= partialDet[tid + stride];
            }
            __syncthreads();
        }

        // Write the result back to the global memory
        if (tid == 0) {
            *determinant = partialDet[0];
        }
    }
}