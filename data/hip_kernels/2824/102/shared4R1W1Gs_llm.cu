#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shared4R1W1Gs(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input to shared memory with bounds check
    if (i < N) {
        Smem[threadIdx.x] = A[i];
    }
    __syncthreads();

    // Compute only if within bounds
    if (i < N) {
        C[i] = Smem[threadIdx.x] + Smem[(threadIdx.x + 1) % 512] + Smem[(threadIdx.x + 2) % 512] + Smem[(threadIdx.x + 3) % 512] + Smem[(threadIdx.x + 4) % 512];
    }
}