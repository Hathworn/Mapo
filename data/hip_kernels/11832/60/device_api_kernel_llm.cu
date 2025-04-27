#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void device_api_kernel(hiprandState *states, float *out, int N)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int nthreads = gridDim.x * blockDim.x;

    if (tid < N)
    {
        // Initialize the state only if the thread processes some elements
        hiprandState state;
        hiprand_init(9384, tid, 0, &state);

        // Use a temporary state variable to improve memory access
        for (int i = tid; i < N; i += nthreads)
        {
            float rand = hiprand_uniform(&state) * 2;
            out[i] = rand;
        }
    }
}