#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diag_normalize(double *A, double *I, int nn, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Utilize shared memory to reduce redundant global memory access.
    __shared__ double diag;

    if (threadIdx.x == 0 && threadIdx.y == 0) {
        diag = A[i * nn + i];
    }
    __syncthreads();

    if (x < nn && y < nn) {
        if (x == y && x == i) {
            I[x * nn + y] /= diag;
            A[x * nn + y] /= diag;
        }
    }
}