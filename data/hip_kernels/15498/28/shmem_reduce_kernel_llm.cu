#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shmem_reduce_kernel(float * d_out, const float * d_in)
{
    // sdata is allocated in the kernel call: 3rd arg to <<<b, t, shmem>>>
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    // Optimized: Prefetch data to shared memory only if within boundaries
    sdata[tid] = (myId < gridDim.x * blockDim.x) ? d_in[myId] : 0.0f;
    __syncthreads();

    // Do reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        // Unroll loop for efficiency
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Only thread 0 writes result for this block back to global memory
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}