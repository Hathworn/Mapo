#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void mask4D(float* in, int* mask, int xstrides0, int xstrides1, int xstrides2, int xstrides3, int scalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use shared memory to store mask values for faster access
    __shared__ int sharedMask[256];
    
    for (int index = threadIdx.x; index < xstrides0; index += blockDim.x) {
        sharedMask[index] = mask[index];
    }
    __syncthreads();
    
    while (tid < scalarCount) {
        int linearIndex = tid;
        int xindex0 = linearIndex / xstrides0;
        linearIndex %= xstrides0;
        int xindex1 = linearIndex / xstrides1;
        linearIndex %= xstrides1;
        int xindex2 = linearIndex / xstrides2;
        int xindex3 = linearIndex % xstrides2;
        
        if (xindex3 >= sharedMask[xindex0]) in[tid] = 0;
        
        tid += stride;
    }
}