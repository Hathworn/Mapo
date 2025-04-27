#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelGetPhi5(const int N, double *T, double *q)
{
    // Use a shared memory to optimize accessing q while calculating phi5
    extern __shared__ double shared_q[];
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load q into shared memory for faster access
    if (i < N)
    {
        shared_q[threadIdx.x] = q[i];
        __syncthreads();

        // Compute phi5 with reduced global memory access
        double q_val = shared_q[threadIdx.x]; // Access from shared memory
        T[i] = q_val * q_val * q_val * q_val * q_val;
    }
}