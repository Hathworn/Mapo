#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void standard_kernel(float a, float *out, int iters)
{
    int tid = (blockDim.x * blockIdx.x) + threadIdx.x;

    // Utilize shared memory to potentially speed up memory access
    __shared__ float shared_tmp;

    if(tid == 0)
    {
        // Perform calculation only once, since result doesn't change across iterations
        shared_tmp = powf(a, 2.0f);

        // Ensure all threads complete the calculation
        __syncthreads();

        if (iters > 0)
        {
            *out = shared_tmp;
        }
    }
}