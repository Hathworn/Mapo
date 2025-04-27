#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createHistCuda(float* siftCentroids, float* siftImage, int linesCent, int linesIm, float* temp)
{
    __shared__ float cosines[BLOCK_SIZE][2];

    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    size_t idy = blockIdx.y;
    size_t tid = threadIdx.x;

    if (idx < linesCent) {
        int centin = idx * 128;
        int imin = idy * 128;

        // Optimize cosine similarity calculation
        float sumab = 0;
        float suma2 = 0;
        float sumb2 = 0;

        #pragma unroll  // Use loop unrolling for better performance
        for (int k = 0; k < 128; k++) {
            float centVal = siftCentroids[centin + k];
            float imgVal = siftImage[imin + k];
            sumab += centVal * imgVal;
            suma2 += imgVal * imgVal;
            sumb2 += centVal * centVal;
        }

        float cossim = sumab / (sqrtf(suma2) * sqrtf(sumb2));  // Simplify division

        cosines[tid][0] = cossim;
        cosines[tid][1] = idx;

        __syncthreads();

        // Optimize for reduction to find the maximum cosine similarity
        for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
            if (tid < s) {
                if (cosines[tid + s][0] > cosines[tid][0]) {
                    cosines[tid][0] = cosines[tid + s][0];
                    cosines[tid][1] = cosines[tid + s][1];
                }
            }
            __syncthreads();
        }

        if (tid == 0) {
            temp[(blockIdx.y * gridDim.x + blockIdx.x) * 2] = cosines[0][0];
            temp[(blockIdx.y * gridDim.x + blockIdx.x) * 2 + 1] = cosines[0][1];
        }
    }
}