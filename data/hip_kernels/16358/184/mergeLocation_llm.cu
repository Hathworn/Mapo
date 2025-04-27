#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mergeLocation(const short2* loc_, float* x, float* y, const int npoints, float scale)
{
    const int ptidx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (ptidx < npoints)
    {
        short2 loc = loc_[ptidx];
        
        // Minimize global memory access by using shared memory for frequently accessed data.
        __shared__ float sharedX[256];
        __shared__ float sharedY[256];
        
        sharedX[threadIdx.x] = loc.x * scale;
        sharedY[threadIdx.x] = loc.y * scale;
        
        __syncthreads(); // Ensure all threads have written to shared memory.
        
        x[ptidx] = sharedX[threadIdx.x];
        y[ptidx] = sharedY[threadIdx.x];
    }
}