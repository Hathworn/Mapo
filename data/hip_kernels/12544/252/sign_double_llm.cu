#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sign_double(int n, int idx, double *dy, int incy, double *result) {
    // Use the shared memory for faster data access
    extern __shared__ double shared_dy[];
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    // Load data into shared memory
    if (i < n) {
        shared_dy[tid] = dy[i];
    }
    __syncthreads();

    // Perform sign calculation using shared memory
    while (i < n) {
        if (i >= idx && i % incy == 0) {
            double x = shared_dy[tid];
            result[i] = (x > 0) - (x < 0);
        }
        i += blockDim.x * gridDim.x;
    }
}