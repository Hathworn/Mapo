#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _mat_mul(float *ma, float *mb, float *target, int len){
    // Using shared memory for better performance
    extern __shared__ float shared_ma[];
    extern __shared__ float shared_mb[];
  
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    if(tid < len){
        // Load data into shared memory
        shared_ma[local_tid] = ma[tid];
        shared_mb[local_tid] = mb[tid];

        __syncthreads();

        // Perform multiplication using shared memory
        target[tid] = shared_ma[local_tid] * shared_mb[local_tid];
    }
}