#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelGetPhi2(const int N, double *T, double *q)
{
    // Use shared memory for faster access
    extern __shared__ double shared_q[];
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int ti = threadIdx.x;

    // Load data into shared memory
    if (i < N) {
        shared_q[ti] = q[i];
        __syncthreads();
        
        // Perform the computation using shared memory
        T[i] = shared_q[ti] * shared_q[ti];
    }
}