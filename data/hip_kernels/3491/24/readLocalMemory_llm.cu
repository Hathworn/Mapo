#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readLocalMemory(const float *data, float *output, int size, int repeat)
{
    int gid = threadIdx.x + blockDim.x * blockIdx.x;
    int tid = threadIdx.x;
    int localSize = blockDim.x;
    int grpid = blockIdx.x;
    int litems = 2048 / localSize;
    int goffset = localSize * grpid + tid * litems;
    int s = tid;
    __shared__ float lbuf[2048];

    // Efficient prefetching from global to shared memory
    int items_to_copy = min(litems, size - goffset);
    for (int j = 0; j < items_to_copy; ++j) {
        lbuf[tid * litems + j] = data[goffset + j];
    }
    
    __syncthreads();

    float sum = 0;
    #pragma unroll 16  // Unroll loop for improved ILP and pipeline utilization
    for (int j = 0; j < repeat; ++j) {
        #pragma unroll 16
        for (int i = 0; i < 16; ++i) {
            sum += lbuf[(s + i) & 2047];
        }
        s = (s + 16) & 2047; // Avoid expensive modulo operation
    }
    output[gid] = sum;
}