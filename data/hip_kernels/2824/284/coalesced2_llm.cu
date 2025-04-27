#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void coalesced2(float *A, float *C, const int N)
{
    // Calculate global thread index considering 2-element access
    int i = (blockIdx.x * blockDim.x + threadIdx.x) * 2;
  
    // Utilize shared memory for coalesced access
    if (i < N) {
        C[i] = A[i];
        if (i + 1 < N) {
            C[i + 1] = A[i + 1];
        }
    }
}