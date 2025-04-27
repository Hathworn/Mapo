#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kUpdate(int nbSpx, float* clusters, float* accAtt_g)
{
    int cluster_idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (cluster_idx < nbSpx) {
        int nbSpx2 = nbSpx * 2;
        int nbSpx3 = nbSpx * 3;
        int nbSpx4 = nbSpx * 4;
        int nbSpx5 = nbSpx * 5;
        int counter = __float2int_rd(accAtt_g[cluster_idx + nbSpx5]); // Use fast integer conversion

        if (counter != 0) {
            float invCounter = 1.0f / counter; // Calculate reciprocal once
            clusters[cluster_idx] = accAtt_g[cluster_idx] * invCounter;
            clusters[cluster_idx + nbSpx] = accAtt_g[cluster_idx + nbSpx] * invCounter;
            clusters[cluster_idx + nbSpx2] = accAtt_g[cluster_idx + nbSpx2] * invCounter;
            clusters[cluster_idx + nbSpx3] = accAtt_g[cluster_idx + nbSpx3] * invCounter;
            clusters[cluster_idx + nbSpx4] = accAtt_g[cluster_idx + nbSpx4] * invCounter;

            // Use a loop to reset accumulator for better scalability
            for (int i = 0; i <= 5; ++i) {
                accAtt_g[cluster_idx + i * nbSpx] = 0;
            }
        }
    }
}