#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    // Utilize shared memory for coalesced access and improved performance
    extern __shared__ short2 sharedLoc[];

    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;

    if (ptidx < npoints)
    {
        sharedLoc[threadIdx.x] = loc_[ptidx]; // Load into shared memory

        __syncthreads(); // Ensure all threads have loaded their data

        const short2 loc = sharedLoc[threadIdx.x]; // Access from shared memory

        x[ptidx] = loc.x * scale;
        y[ptidx] = loc.y * scale;
    }
}