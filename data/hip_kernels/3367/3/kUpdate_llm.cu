#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kUpdate(int nbSpx, float* clusters, float* accAtt_g)
{
    int cluster_idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use temporary variables to store computed offsets
    if (cluster_idx < nbSpx) {
        int offset1 = cluster_idx + nbSpx;
        int offset2 = cluster_idx + 2 * nbSpx;
        int offset3 = cluster_idx + 3 * nbSpx;
        int offset4 = cluster_idx + 4 * nbSpx;
        int offset5 = cluster_idx + 5 * nbSpx;
        
        int counter = accAtt_g[offset5];
        
        if (counter != 0) {
            // Use precomputed offsets for efficient memory access
            clusters[cluster_idx] = accAtt_g[cluster_idx] / counter;
            clusters[offset1] = accAtt_g[offset1] / counter;
            clusters[offset2] = accAtt_g[offset2] / counter;
            clusters[offset3] = accAtt_g[offset3] / counter;
            clusters[offset4] = accAtt_g[offset4] / counter;

            // Reset accumulators using precomputed offsets
            accAtt_g[cluster_idx] = 0;
            accAtt_g[offset1] = 0;
            accAtt_g[offset2] = 0;
            accAtt_g[offset3] = 0;
            accAtt_g[offset4] = 0;
            accAtt_g[offset5] = 0;
        }
    }
}