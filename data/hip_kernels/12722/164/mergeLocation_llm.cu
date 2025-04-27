#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better access speed if thread block size is small
    extern __shared__ short2 shmem[];
    if (ptidx < npoints)
    {
        shmem[threadIdx.x] = loc_[ptidx];
        __syncthreads();

        // Efficiently access shared memory
        short2 loc = shmem[threadIdx.x];
        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}