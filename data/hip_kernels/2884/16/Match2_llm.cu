#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Match2(float *d_pts1, float *d_pts2, float *d_score, int *d_index)
{
    __shared__ float buffer1[M2W*NDIM];
    __shared__ float buffer2[M2H*NDIM];
    __shared__ float scores[M2W*M2H];
    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int bp1 = M2W*blockIdx.x;

    // Optimize loading of buffer1: Ensure coalesced access
    for (int d=ty; d<NDIM; d+=M2H)
        buffer1[tx*NDIM + d] = d_pts1[(bp1 + tx)*NDIM + d];
    __syncthreads();

    float max_score = 0.0f;
    int index = -1;

    // Optimize buffer2 loading and score calculation
    for (int bp2=0; bp2<NPTS; bp2+=M2H) {
        for (int d=ty; d<NDIM; d+=M2H)
            buffer2[tx*NDIM + d] = d_pts2[(bp2 + tx)*NDIM + d];
        __syncthreads();

        float score = 0.0f;
        for (int d=0; d<NDIM; d++)
            score += buffer1[tx*NDIM + d] * buffer2[ty*NDIM + d]; 

        atomicMax(&scores[tx], score);  // Reduce scores using atomicMax
        __syncthreads();

        if (tx == 0 && scores[ty] > max_score) {
            max_score = scores[ty];
            index = bp2 + ty;
        }
        __syncthreads();
    }

    if (tx == 0) {
        d_score[bp1 + ty] = max_score;
        d_index[bp1 + ty] = index;
    }
}