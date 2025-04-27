#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void orthogonalize23( float *Qi_gdof, int *blocksizes, int numblocks, int largestblock ) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= numblocks) return; // Check bounds

    for (int j = 4; j < 6; j++) {
        for (int k = 3; k < j; k++) { // Vectors we're orthogonalizing against
            float dot_prod = 0.0;
            // Vectorized window into Qi_gdof
            float* base_j = Qi_gdof + i * 6 * largestblock + j;
            float* base_k = Qi_gdof + i * 6 * largestblock + k;

            // Use shared memory or loop unrolling for optimization
            for (int l = 0; l < blocksizes[i]; l++) {
                dot_prod += base_k[l * 6] * base_j[l * 6];
            }
            
            // Adjust Q_i
            for (int l = 0; l < blocksizes[i]; l++) {
                base_j[l * 6] -= base_k[l * 6] * dot_prod;
            }
        }

        float rotnorm = 0.0;
        // Norm calculation
        for (int l = 0; l < blocksizes[i]; l++) {
            float v = Qi_gdof[i * 6 * largestblock + l * 6 + j];
            rotnorm += v * v;
        }

        rotnorm = rsqrt(rotnorm); // Use rsqrt for faster computation

        // Normalize Q_i
        for (int l = 0; l < blocksizes[i]; l++) {
            Qi_gdof[i * 6 * largestblock + l * 6 + j] *= rotnorm;
        }
    }
}