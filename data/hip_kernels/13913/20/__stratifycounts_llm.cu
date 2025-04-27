#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __stratifycounts(float *strata, int n,  float *a, unsigned int *bi) {
    __shared__ unsigned int ic[SNDVALS][SNDGRPS];
    __shared__ float ss[SNDVALS];
    int istart = (int)(((long long)blockIdx.x) * n / gridDim.x);
    int iend = (int)(((long long)(blockIdx.x+1)) * n / gridDim.x);
    int bibase = SNDVALS * (blockIdx.x + istart / SBIGBLK);
    int tid = threadIdx.x + threadIdx.y * blockDim.x;

    // Load strata to shared memory by the first warp
    if (threadIdx.y == 0 && threadIdx.x < SNDVALS) {
        ss[threadIdx.x] = strata[threadIdx.x];
    }
    __syncthreads();

    for (int i = istart; i < iend; i += SBIGBLK) {
        // Initialize shared memory histogram bins
        if (threadIdx.y < SNDGRPS && threadIdx.x < SNDVALS) {
            ic[threadIdx.x][threadIdx.y] = 0;
        }
        __syncthreads();
        
        for (int k = i + tid; k < min(iend, i + SBIGBLK); k += SNTHREADS) {
            float v = a[k];
            int j = 0;
            
            // Unroll the loop for stratum calculation
            #pragma unroll
            for (int idx = 0; idx < 8; ++idx) {
                j = (v > ss[j]) ? 2*j+2 : 2*j+1;
            }
            
            j = j - SNDVALS + 1;
            atomicAdd(&ic[j][threadIdx.y], 1);  // Use atomicAdd instead of atomicInc
        }
        __syncthreads();
        
        // Sum histogram bins using first column of threads
        if (threadIdx.y == 0 && threadIdx.x < SNDVALS) {
            unsigned int sum = 0;
            #pragma unroll
            for (int idx = 0; idx < SNDGRPS; ++idx) {
                sum += ic[threadIdx.x][idx];
            }
            bi[bibase + threadIdx.x] = sum;
        }
        bibase += SNDVALS;
    }
}