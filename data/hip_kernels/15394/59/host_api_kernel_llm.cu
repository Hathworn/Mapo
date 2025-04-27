#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void host_api_kernel(float *randomValues, float *out, int N)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;

    // Utilize a stride loop for improved memory access and coalescing
    for (int i = tid; i < N; i += nthreads)
    {
        out[i] = randomValues[i] * 2;  // Inline operation to avoid temporary variable
    }
}