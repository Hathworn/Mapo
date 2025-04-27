#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cu_pooling_overlap_max(const float* src, float* dst, float *loc, const int rowssrc, const int colssrc, const int rowsdst, const int colsdst, const int sizex, const int sizey, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    while (tid < n) {
        int cdst = tid % colsdst;
        int rdst = tid / colsdst;
        int rsrc = rdst;
        int csrc = cdst;
        float max_val = -FLT_MAX;  // Initialize to minimum float
        int max_loc = rsrc * colssrc + csrc;

        int xend = csrc + sizex - 1;
        int yend = rsrc + sizey - 1;

        for (int i = rsrc; i <= yend; ++i) {
            for (int j = csrc; j <= xend; ++j) {
                int idx = i * colssrc + j;
                if (src[idx] > max_val) {  // Check for max value
                    max_val = src[idx];
                    max_loc = idx;
                }
            }
        }

        dst[tid] = max_val;  // Set max value
        loc[tid] = (float)max_loc;  // Store location of max value
        tid += stride;
    }
}