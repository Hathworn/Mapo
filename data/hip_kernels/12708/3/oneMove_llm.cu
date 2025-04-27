```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define INF 2147483647

extern "C" {

}

__global__ void oneMove(int * tab, int dist, int pow, int blocksPerTask, int period) {
    __shared__ int tmp_T[1024];
    __shared__ int begin;

    // Calculate begin index once per block
    if(threadIdx.x == 0)
        begin = (blockIdx.x / blocksPerTask) * dist * 2 + (blockIdx.x % blocksPerTask) * 512 * pow;

    __syncthreads();

    int offset = (blockIdx.x / period) % 2 == 0 ? 1 : -1; // Determine sorting direction
    
    for(int i = begin; i < begin + pow * 512; i += 512) {
        int threadIdxMod = threadIdx.x % 512;
        
        // Load elements to shared memory
        if(threadIdxMod < 512) 
            tmp_T[threadIdx.x] = tab[i + threadIdx.x];
        else 
            tmp_T[threadIdx.x] = tab[i + threadIdx.x - 512 + dist];

        __syncthreads();

        // Compare and swap in shared memory
        if(threadIdxMod < 512 && (offset * tmp_T[threadIdx.x]) > (offset * tmp_T[threadIdx.x + 512])) {
            int temp = tmp_T[threadIdx.x];
            tmp_T[threadIdx.x] = tmp_T[threadIdx.x + 512];
            tmp_T[threadIdx.x + 512] = temp;
        }

        __syncthreads();

        // Store back the sorted results
        if(threadIdxMod < 512) 
            tab[i + threadIdx.x] = tmp_T[threadIdx.x];
        else 
            tab[i + threadIdx.x - 512 + dist] = tmp_T[threadIdx.x];

        __syncthreads();
    }
}