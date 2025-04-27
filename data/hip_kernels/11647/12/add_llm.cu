#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int* in, int* out, int n) {

    int gid = threadIdx.x + blockIdx.x * blockDim.x;
    if (gid >= n) return;
    
    extern __shared__ int temp[];

    // Store initial values in shared memory
    temp[threadIdx.x] = (gid > 0) ? in[gid - 1] : 0;
    __syncthreads();

    // Use single index for temp memory to reduce computation
    for (int offset = 1; offset < n; offset <<= 1) {
        int val = (threadIdx.x >= offset) ? temp[threadIdx.x - offset] : 0;
        __syncthreads();
        temp[threadIdx.x] += val;
        __syncthreads();
    }
    out[gid] = temp[threadIdx.x];
}