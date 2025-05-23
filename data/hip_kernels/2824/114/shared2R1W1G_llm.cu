#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shared2R1W1G(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N) {
        // Load data into shared memory
        Smem[threadIdx.x] = static_cast<float>(i);

        // Synchronize to make sure all threads have written to shared memory
        __syncthreads();

        // Compute result using neighboring shared memory values
        C[i] = Smem[(threadIdx.x + 1) % 512] + Smem[(threadIdx.x + 5) % 512];
    }
}