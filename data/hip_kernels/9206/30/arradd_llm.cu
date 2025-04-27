#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void arradd(const int *md, const int *nd, int *pd, int size) {
    int myid = blockDim.x * blockIdx.x + threadIdx.x;
    // Use shared memory for loading inputs
    __shared__ int mds[256];
    __shared__ int nds[256];
    
    if (myid < size) {
        // Load data into shared memory to reduce global memory accesses
        mds[threadIdx.x] = md[myid];
        nds[threadIdx.x] = nd[myid];
        __syncthreads(); // Ensure shared memory is loaded
        
        // Perform addition using shared memory
        pd[myid] = mds[threadIdx.x] + nds[threadIdx.x];
    }
}