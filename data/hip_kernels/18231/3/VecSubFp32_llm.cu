#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecSubFp32(float* in0, float* in1, float* out, int cnt)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to improve data access speed
    __shared__ float s_in0[256];
    __shared__ float s_in1[256];
    
    if (tid < cnt) {
        s_in0[threadIdx.x] = in0[tid];
        s_in1[threadIdx.x] = in1[tid];
        __syncthreads(); // Ensure all threads have loaded data into shared memory

        out[tid] = s_in0[threadIdx.x] - s_in1[threadIdx.x];
    }
}