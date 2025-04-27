#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *A, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x * 16;

    // Utilize vectorized memory accesses assuming A and C are aligned
    #pragma unroll
    for (int j = 0; j < 16; j++) {
        if (i + j < N) {
            C[i + j] = A[i + j];
        }
    }
}