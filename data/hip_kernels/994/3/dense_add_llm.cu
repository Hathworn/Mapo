#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dense_add(size_t sz, float_t* src, float_t* dest)
{
    // Use shared memory for better access speed
    extern __shared__ float_t sharedSrc[];
    
    // Each block loads its portion of src into shared memory
    if(threadIdx.x < sz)
    {
        sharedSrc[threadIdx.x] = src[threadIdx.x];
    }
    __syncthreads();

    // Compute global index for dest
    size_t destIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only add if within bounds, using shared memory for src
    if(destIndex < sz && threadIdx.x < sz)
    {
        dest[destIndex] += sharedSrc[threadIdx.x];
    }
}