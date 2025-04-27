#include "hip/hip_runtime.h"
#include "includes.h"
/*-----This is a vector addition--*/
/*---- @ Cuda/c ------*/
/*---- __NS__Bologna__2020__*/

__global__ void vectorAdd(int* a, int* b, int* c, int n) {
    // Calculate index thread
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize by using shared memory to reduce global memory access
    extern __shared__ int shared[];
    if (tid < n) {
        shared[threadIdx.x] = a[tid] + b[tid];
        __syncthreads();
        c[tid] = shared[threadIdx.x];
    }
}