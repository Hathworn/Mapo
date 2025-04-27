#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#ifndef MAP_FILE
#define MAP_FILE MAP_SHARED
#endif

__global__ void shift0(float* in, float* out, int inDim0, int inStride0, int inStride1, int inScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Use a conditional to check array bounds first
    if(tid < inScalarCount) {
        int linearIndex = tid;
        int inIndex0 = linearIndex / inStride0;
        linearIndex = linearIndex - inIndex0 * inStride0;
        int inIndex1 = linearIndex / inStride1;
        
        // Use atomic operation for handling race conditions
        if (inIndex0 + inIndex1 < inDim0) {
            atomicExch(&out[tid + inIndex1 * inStride0], in[tid]);
        }
    }
}