#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shared1R8C1W1G1RG(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid branch divergence by checking condition globally
    if (i < N) {
        // Use efficient modulo operation by ensuring shared memory access is within bounds
        int index = threadIdx.x + 1;
        index %= 512;
        
        Smem[index] = A[i];
        
        int readIndex = threadIdx.x * 8;
        readIndex %= 512;

        C[i] = Smem[readIndex];
    }
}