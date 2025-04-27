```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void testKernel(float *g_idata, float *g_odata)
{
    // shared memory with size determined by the host application
    extern __shared__ float sdata[];

    // access thread id
    const unsigned int tid = threadIdx.x;
    // optimized using block and grid sizes for larger datasets
    const unsigned int idx = blockIdx.x * blockDim.x + tid;
    
    // read in input data from global memory
    sdata[tid] = g_idata[idx];
    __syncthreads();

    // perform computations
    sdata[tid] *= blockDim.x; // use *= for in-place multiply
    __syncthreads();

    // write data to global memory
    g_odata[idx] = sdata[tid];
}