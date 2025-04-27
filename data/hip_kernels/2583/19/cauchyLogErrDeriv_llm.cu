#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
{
}

__global__ void cauchyLogErrDeriv(int N, int M, float *A, float *Y, float *out)
{
    // Use shared memory for faster access (assuming N and M are small)
    __shared__ float sharedA[1024]; // Adjust size based on shared memory usage constraints
    __shared__ float sharedY[1024]; // Adjust size based on shared memory usage constraints

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    int index = j*N + i;
    int L = N*M;

    if (i < N && j < M)
    {
        // Load data into shared memory
        sharedA[threadIdx.y * blockDim.x + threadIdx.x] = A[index];
        sharedY[threadIdx.y * blockDim.x + threadIdx.x] = Y[index];
        __syncthreads();

        // Use shared memory for computation
        float a = __expf(sharedA[threadIdx.y * blockDim.x + threadIdx.x + L]);
        
        if (sharedA[threadIdx.y * blockDim.x + threadIdx.x] > sharedY[threadIdx.y * blockDim.x + threadIdx.x])
        {
            out[index] = a;
        }
        else if (sharedA[threadIdx.y * blockDim.x + threadIdx.x] < sharedY[threadIdx.y * blockDim.x + threadIdx.x])
        {
            out[index] = -a;
        }
        else
        {
            out[index] = 0.0;
        }

        out[index+L] = __fmaf_rn(a, fabsf(__fsub_rn(sharedA[threadIdx.y * blockDim.x + threadIdx.x], sharedY[threadIdx.y * blockDim.x + threadIdx.x])), -1.0);
    }
}