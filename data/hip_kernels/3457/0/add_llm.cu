#include "hip/hip_runtime.h"
#include "includes.h"

#define N 2560
#define M 512
#define BLOCK_SIZE (N/M)
#define RADIUS 5

__global__ void add(double *a, double *b, double *c, int n){
    // Utilize shared memory for better memory access performance
    extern __shared__ double shared_a[];

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int localIdx = threadIdx.x;

    if (idx < n) {
        // Load data into shared memory
        shared_a[localIdx] = a[idx];
        __syncthreads(); // Ensure all threads have loaded their data

        // Perform computation
        c[idx] = shared_a[localIdx] + b[idx];
    }
}