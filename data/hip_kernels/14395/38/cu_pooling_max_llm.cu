#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_pooling_max(const float* __restrict__ src, float* __restrict__ dst, float* __restrict__ loc, const int rowssrc, const int colssrc, const int rowsdst, const int colsdst, const int stridex, const int stridey, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    while (tid < n) {
        int cdst = tid % colsdst;
        int rdst = tid / colsdst;
        int rsrc = rdst * stridey;
        int csrc = cdst * stridex;
        int xend = min(colssrc - 1, csrc + stridex - 1);
        int yend = min(rowssrc - 1, rsrc + stridey - 1);

        loc[tid] = (float)(rsrc * colssrc + csrc);
        float max_val = dst[tid];  // Cache the max value
		
        for (int i = rsrc; i <= yend; ++i) {
            for (int j = csrc; j <= xend; ++j) {
                float val = src[i * colssrc + j];  // Cache the current value
                if (val > max_val) {
                    max_val = val;
                    loc[tid] = (float)(i * colssrc + j);
                }
            }
        }
        dst[tid] = max_val;  // Store the max value back
        tid += stride;
    }
}