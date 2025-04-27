#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __stratifycounts(double *strata, int n, double *a, unsigned int *bi) {
    __shared__ unsigned int ic[SNDVALS][SNDGRPS];
    __shared__ double ss[SNDVALS];
    int istart = (int)(((long long)blockIdx.x) * n / gridDim.x);
    int iend = (int)(((long long)(blockIdx.x+1)) * n / gridDim.x);
    int bibase = SNDVALS * (blockIdx.x + istart / SBIGBLK);
    int tid = threadIdx.x + threadIdx.y * blockDim.x;

    // Load strata into shared memory with all threads in x-dimension
    if (threadIdx.y == 0 && threadIdx.x < SNDVALS) {
        ss[threadIdx.x] = strata[threadIdx.x];
    }
    __syncthreads();  // Ensure shared memory is populated

    for (int i = istart; i < iend; i += SBIGBLK) {
        // Zero-initialize ic for each SNDVALS
        if (threadIdx.y < SNDGRPS && threadIdx.x < SNDVALS) {
            ic[threadIdx.x][threadIdx.y] = 0;
        }
        __syncthreads();

        // Processing data in each thread
        for (int k = i + tid; k < min(iend, i + SBIGBLK); k += SNTHREADS) {
            double v = a[k];
            int j = 0;
            // Iterate conditionally based on strata
            #pragma unroll 8
            for (int idx = 0; idx < 8; ++idx) {
                j = (v > ss[j]) ? 2 * j + 2 : 2 * j + 1;
            }
            j = j - SNDVALS + 1;
            // Atomic increment of histogram
            atomicAdd(&ic[j][threadIdx.y], 1);
        }
        __syncthreads();

        // Reduce partial results for output
        if (threadIdx.y == 0 && threadIdx.x < SNDVALS) {
            unsigned int sum = 0;
            for (int grp = 0; grp < SNDGRPS; ++grp) {
                sum += ic[threadIdx.x][grp];
            }
            bi[bibase + threadIdx.x] = sum;
        }
        __syncthreads();
        
        // Move base index for next block
        bibase += SNDVALS;
    }
}