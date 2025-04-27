#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void testKernel(float *g_idata, float *g_odata)
{
    // shared memory
    // the size is determined by the host application
    extern __shared__ float sdata[];

    // access thread id and number of threads in this block
    const unsigned int tid = threadIdx.x;
    const unsigned int num_threads = blockDim.x;
    const unsigned int gid = blockIdx.x * blockDim.x + tid;

    // read in input data from global memory
    sdata[tid] = g_idata[gid];
    __syncthreads();

    // perform some computations
    sdata[tid] *= (float)num_threads;
    __syncthreads();

    // write data to global memory
    g_odata[gid] = sdata[tid];
}