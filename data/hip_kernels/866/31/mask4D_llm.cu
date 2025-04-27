#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void mask4D(float* in, int* mask, int xstrides0, int xstrides1, int xstrides2, int xstrides3, int scalarCount) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to load mask values to reduce global memory accesses
    __shared__ int shared_mask[32];  // Assuming xstrides0 <= 32, adjust if necessary
    if(threadIdx.x < xstrides0) {
        shared_mask[threadIdx.x] = mask[threadIdx.x];
    }
    __syncthreads();

    for (; tid < scalarCount; tid += stride) {
        int linearIndex = tid;
        int xindex0 = linearIndex / xstrides0;
        linearIndex -= xstrides0 * xindex0;
        int xindex1 = linearIndex / xstrides1;
        linearIndex -= xstrides1 * xindex1;
        int xindex2 = linearIndex / xstrides2;
        int xindex3 = linearIndex - xstrides2 * xindex2;
        
        // Use shared memory reference for mask
        if (xindex3 >= shared_mask[xindex0]) in[tid] = 0;
    }
}