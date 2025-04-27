#include "hip/hip_runtime.h"
#include "includes.h"

#define MATLAB_CODE 0
#define MAX_PITCH_VALUE_IN_BYTES       262144
#define MAX_TEXTURE_WIDTH_IN_BYTES     65536
#define MAX_TEXTURE_HEIGHT_IN_BYTES    32768
#define MAX_PART_OF_FREE_MEMORY_USED   0.9
#define BLOCK_DIM                      16

texture<float, 2, hipReadModeElementType> texA;

__global__ void cuComputeDistanceTexture(int wA, float * B, int wB, int pB, int dim, float* AB) {
    // Calculate the x and y indices
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int yIndex = blockIdx.y * blockDim.y + threadIdx.y;

    if (xIndex < wB && yIndex < wA) {
        float ssd = 0;
        // Unroll the loop for improved performance
        for (int i = 0; i < dim; i += 4) {
            float tmp1 = tex2D(texA, (float)yIndex, (float)i) - B[i * pB + xIndex];
            ssd += tmp1 * tmp1;
            if (i + 1 < dim) {
                float tmp2 = tex2D(texA, (float)yIndex, (float)(i + 1)) - B[(i + 1) * pB + xIndex];
                ssd += tmp2 * tmp2;
            }
            if (i + 2 < dim) {
                float tmp3 = tex2D(texA, (float)yIndex, (float)(i + 2)) - B[(i + 2) * pB + xIndex];
                ssd += tmp3 * tmp3;
            }
            if (i + 3 < dim) {
                float tmp4 = tex2D(texA, (float)yIndex, (float)(i + 3)) - B[(i + 3) * pB + xIndex];
                ssd += tmp4 * tmp4;
            }
        }
        // Write the computed distance to the output matrix
        AB[yIndex * pB + xIndex] = ssd;
    }
}