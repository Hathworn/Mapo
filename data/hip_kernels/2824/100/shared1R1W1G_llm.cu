#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shared1R1W1G(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use conditional to avoid out-of-bounds access and unnecessary writes
    if (i < N) {
        Smem[threadIdx.x] = i;
        __syncthreads();  // Ensure all writes to shared memory have completed

        // Correct modulo to prevent accessing out-of-bound with small arrays
        C[i] = Smem[(threadIdx.x + 1) & (511)]; 
    }
}