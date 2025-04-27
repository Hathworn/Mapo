```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Prepare_1_MeansForJoin(float* input, int c_src1, int c_src2, int c_n, float* delta, int imageWidth, int imageHeight)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation

    int size = imageWidth * imageHeight;

    if (id >= size) return; // Early exit if id is out of bounds

    int px = id % imageWidth;
    int py = id / imageWidth;

    bool insideSrc1 = delta[c_src1 * NUM_SUMS * size + 4 * size + id] != 0;
    bool insideSrc2 = delta[c_src2 * NUM_SUMS * size + 4 * size + id] != 0;

    if (input[id] > 0 && (insideSrc1 || insideSrc2)) {

        float2 pixPos = { 2.0f * px / imageWidth - 1, 2.0f * py / imageHeight - 1 };

        // Cache the common index calculation
        int baseIndex = c_n * NUM_SUMS * size + id; 

        // Update delta array with weighted positions and positions squared
        delta[baseIndex + 0 * size] = input[id] * pixPos.x;
        delta[baseIndex + 1 * size] = input[id] * pixPos.y;
        delta[baseIndex + 2 * size] = input[id] * pixPos.x * pixPos.x;
        delta[baseIndex + 3 * size] = input[id] * pixPos.y * pixPos.y;
        delta[baseIndex + 4 * size] = input[id];
    }
    else
    {
        // Cache the common index calculation
        int baseIndex = c_n * NUM_SUMS * size + id;

        // Set all required delta array entries to zero
        delta[baseIndex + 0 * size] = 0;
        delta[baseIndex + 1 * size] = 0;
        delta[baseIndex + 2 * size] = 0;
        delta[baseIndex + 3 * size] = 0;
        delta[baseIndex + 4 * size] = 0;
    }
}