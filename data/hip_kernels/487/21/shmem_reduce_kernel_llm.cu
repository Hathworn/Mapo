#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shmem_reduce_kernel(float * d_out, const float * d_in)
{
    // sdata is allocated in the kernel call: 3rd arg to <<<b, t, shmem>>>
    extern __shared__ float sdata[];

    int myId = threadIdx.x + blockDim.x * blockIdx.x;
    int tid  = threadIdx.x;

    // load shared mem from global mem
    sdata[tid] = d_in[myId];
    __syncthreads(); // ensure shared memory is fully populated

    // warp-level reduction optimization
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads(); // sync only when necessary
    }

    // unroll the last warp
    if (tid < 32)
    {
        volatile float* v_sdata = sdata; // prevent data relocation
        v_sdata[tid] += v_sdata[tid + 32];
        v_sdata[tid] += v_sdata[tid + 16];
        v_sdata[tid] += v_sdata[tid + 8];
        v_sdata[tid] += v_sdata[tid + 4];
        v_sdata[tid] += v_sdata[tid + 2];
        v_sdata[tid] += v_sdata[tid + 1];
    }

    // only thread 0 writes result for this block back to global mem
    if (tid == 0)
    {
        d_out[blockIdx.x] = sdata[0];
    }
}