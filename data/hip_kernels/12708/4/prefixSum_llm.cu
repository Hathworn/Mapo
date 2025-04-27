#include "hip/hip_runtime.h"
#include "includes.h"

#define getPos(a,k) (((a)>>(k-1))&1)

extern "C" {

}

__global__ void prefixSum(int * input_T, int * prefix_T, int * prefix_helper_T, int n, int k, int blockPower) {
    __shared__ int tmp_T[1024];
    
    int globalIdx = threadIdx.x + 1024 * blockIdx.x;
    int gridSize = 1024 * gridDim.x;

    for(int i = 0; i < blockPower; i++) {
        int idx = globalIdx + i * gridSize;
        if (idx >= n) return;
        
        // Load input to shared memory and transform
        tmp_T[threadIdx.x] = getPos(input_T[idx], k);

        // Perform a parallel scan (Hillis-Steele)
        int val, kk = 1;
        while(kk <= 512) {
            __syncthreads();
            if (kk <= threadIdx.x) val = tmp_T[threadIdx.x - kk];
            __syncthreads();
            // Condition checked again to avoid unnecessary writes
            if (kk <= threadIdx.x) tmp_T[threadIdx.x] += val;
            kk *= 2;
        }
        
        __syncthreads();

        prefix_T[idx] = tmp_T[threadIdx.x];
        
        // Store the last element of each segment
        if (threadIdx.x == 1023 || idx == n-1) {
            prefix_helper_T[i * gridDim.x + blockIdx.x + 1] = tmp_T[threadIdx.x];
        }
    }
}