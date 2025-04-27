#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Match3(float *d_pts1, float *d_pts2, float *d_score, int *d_index)
{
    __shared__ float buffer1[M2W*(NDIM + 1)];
    __shared__ float buffer2[M2H*NDIM];
    __shared__ float scores[M2W*M2H];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int idx = tx + M2W*ty;
    int bp1 = M2W*blockIdx.x;

    // Load d_pts1 into shared memory buffer1
    if (ty < M2H) {
        #pragma unroll
        for (int j = ty; j < M2W; j += M2H) {
            #pragma unroll
            for (int d = tx; d < NDIM; d += M2W) {
                buffer1[j*(NDIM + 1) + d] = d_pts1[(bp1 + j)*NDIM + d];
            }
        }
    }
    __syncthreads();

    float max_score = 0.0f;
    int index = -1;

    // Loop over d_pts2 in blocks of M2H
    for (int bp2 = 0; bp2 < NPTS; bp2 += M2H) {
        // Load d_pts2 into shared memory buffer2
        #pragma unroll
        for (int d = tx; d < NDIM; d += M2W) {
            buffer2[ty*NDIM + d] = d_pts2[(bp2 + ty)*NDIM + d];
        }
        __syncthreads();

        float score = 0.0f;
        
        // Calculate score
        #pragma unroll
        for (int d = 0; d < NDIM; d++) {
            score += buffer1[tx*(NDIM + 1) + d] * buffer2[ty*NDIM + d];
        }
        scores[idx] = score;
        __syncthreads();

        // Reduce scores within the warp
        if (ty == 0) {
            float local_max = max_score;
            int local_index = index;

            #pragma unroll
            for (int i = 0; i < M2H; i++) {
                float temp_score = scores[i*M2W + tx];
                if (temp_score > local_max) {
                    local_max = temp_score;
                    local_index = bp2 + i;
                }
            }

            max_score = local_max;
            index = local_index;
        }
        __syncthreads();
    }

    // Write back the result
    if (ty == 0) {
        d_score[bp1 + tx] = max_score;
        d_index[bp1 + tx] = index;
    }
}