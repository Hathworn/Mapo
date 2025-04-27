#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void skip_128b(float *A, float *C, const int N)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure correct memory alignment with offset
    i += 32 * (threadIdx.x % 32);

    // Efficient memory access avoiding conditional checks
    if (i < N) {
        C[i] = A[i];
    }
}