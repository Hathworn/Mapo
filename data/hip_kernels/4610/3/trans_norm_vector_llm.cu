#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void trans_norm_vector(double* A, double* x, double* y, double* tmp, int NX, int NY)
{
    // Use shared memory to store partial results and reduce global memory access
    extern __shared__ double shared_tmp[];

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int threadId = threadIdx.x;
    
    shared_tmp[threadId] = 0;

    for (int j = 0; j < NY; j++) {
        shared_tmp[threadId] += A[i * NY + j] * x[j];
    }

    __syncthreads();

    // Store result back in global memory
    tmp[i] = shared_tmp[threadId];
}