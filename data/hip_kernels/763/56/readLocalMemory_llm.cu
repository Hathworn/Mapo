#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readLocalMemory(const float *data, float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    float sum = 0;
    int tid = threadIdx.x, localSize = blockDim.x, grpid = blockIdx.x;
    int litems = 2048 / localSize, goffset = localSize * grpid + tid * litems;
    int s = tid;
    __shared__ float lbuf[2048];

    // Use coalesced memory access
    for (int j = 0; j < litems && (j + goffset) < size ; ++j)
    {
        lbuf[tid * litems + j] = data[goffset + j];
    }
    __syncthreads();

    for (int j = 0; j < repeat; ++j)
    {
        // Unroll loop for better performance
        #pragma unroll
        for (int i = 0; i < 16; ++i)
        {
            sum += lbuf[(s + i) & 2047];
        }
        s = (s + 16) & 2047;
    }
    output[gid] = sum;
}