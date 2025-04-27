#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gaussjordan(double *A, double *I, int n, int i) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Create a shared memory space to store row i of A and I
    __shared__ double shared_Ai[1024];
    __shared__ double shared_Ii[1024];
    
    // Load row i into shared memory
    if (y < n) {
        shared_Ai[y] = A[i * n + y];
        shared_Ii[y] = I[i * n + y];
    }
    __syncthreads();

    if (x < n && y < n) {
        if (x != i) {
            I[x * n + y] -= shared_Ii[y] * A[x * n + i];
            if (y != i) {
                A[x * n + y] -= shared_Ai[y] * A[x * n + i];
            }
        }
    }
}