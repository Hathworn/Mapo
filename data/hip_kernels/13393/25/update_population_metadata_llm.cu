#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_population_metadata(unsigned int *pop, unsigned int rows, unsigned int cols, unsigned int *free, unsigned int *lost, unsigned int *fixed) {
    unsigned int tid = threadIdx.y * blockDim.x + threadIdx.x;
    
    __shared__ unsigned int sPop[MAX_THREADS];
    __shared__ unsigned int sMeta[MAX_THREADS];
    
    unsigned int b_offset = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int offset = threadIdx.y * cols + b_offset;
    unsigned int mat_size = rows * cols;
    
    // Initialize shared memory meta data
    sMeta[tid] = (threadIdx.y & 1) == 0 ? ~0 : 0;
    __syncthreads();

    unsigned int i = 0;
    while (i < rows) {
        sPop[tid] = (offset < mat_size) ? pop[offset] : 0;
        __syncthreads();

        // Perform bitwise operations based on thread responsibility
        if (offset < mat_size) {
            unsigned int d = sPop[tid];
            unsigned int e = sPop[tid + ((threadIdx.y & 1) == 0 ? blockDim.x : 0)];
            sMeta[tid] = (threadIdx.y & 1) == 0 ? (sMeta[tid] & (d & e)) : (sMeta[tid] | (d | e));
        }
        __syncthreads();
        
        offset += blockDim.y * cols;
        i += blockDim.y;
    }

    // Hierarchical warp reduction
    for (i = 4; i <= 32; i <<= 1) {
        unsigned int t = tid + (i / 2) * blockDim.x;
        unsigned int masked = threadIdx.y & (i - 1);
        __syncthreads();

        if (masked == 0) {
            sMeta[tid] &= sMeta[t % MAX_THREADS];
        } else if (masked == 1) {
            sMeta[tid] |= sMeta[t % MAX_THREADS];
        }
        __syncthreads();
    }
    
    // Final write-back using a single warp
    if (threadIdx.y == 0) {
        unsigned int fxd = sMeta[threadIdx.x];
        unsigned int lst = ~sMeta[blockDim.x + threadIdx.x];
        free[b_offset] = (fxd | lst);
        fixed[b_offset] = fxd;
        lost[b_offset] = lst;
    }
    __syncthreads();
}