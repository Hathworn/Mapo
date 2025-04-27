#include "hip/hip_runtime.h"
#include "includes.h"

// filename: eeTanh.cu
// a simple CUDA kernel to square the elements of a matrix

extern "C" // ensure function name to be exactly "eeTanh"
{

__global__ void absErrDeriv(int N, int M, float *A, float *Y, float *out)
{
    // Use shared memory for better memory access efficiency
    extern __shared__ float sharedMem[];
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate global index
    int index = j * N + i;

    // Check boundaries
    if (i < N && j < M)
    {
        // Use registers and shared memory for inputs within block
        float a_val = A[index];
        float y_val = Y[index];
        sharedMem[threadIdx.y * blockDim.x + threadIdx.x] = copysignf(1.0, __fsub_rn(a_val, y_val));

        __syncthreads();

        // Write output back from shared memory
        out[index] = sharedMem[threadIdx.y * blockDim.x + threadIdx.x];
    }
}

}