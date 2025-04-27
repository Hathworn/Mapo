#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readLocalMemory(const float *data, float *output, int size, int repeat)
{
    int tid = threadIdx.x;
    int localSize = blockDim.x;
    int grpid = blockIdx.x;
    int gid = tid + (localSize * grpid);
    int litems = 2048 / localSize;
    int goffset = localSize * grpid + tid * litems;

    __shared__ float lbuf[2048];

    // Load data only once
    for (int j = 0; j < litems && j < (size - goffset); ++j)
        lbuf[tid * litems + j] = data[goffset + j];
    
    __syncthreads();

    float sum = 0;
    int s = tid * litems;

    // Reduce redundant calculations
    for (int j = 0; j < repeat; ++j)
    {
        #pragma unroll
        for(int k = 0; k < 16; ++k)
            sum += lbuf[(s + k) & 2047];
        s = (s + 16) & 2047;
    }
    
    output[gid] = sum;
}