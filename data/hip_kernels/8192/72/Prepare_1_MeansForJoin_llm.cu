#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Prepare_1_MeansForJoin(float* input, int c_src1, int c_src2, int c_n, float* delta, int imageWidth, int imageHeight)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int size = imageWidth * imageHeight;

    // Calculate linear index if within bounds
    if (id < size) {
        int px = id % imageWidth;
        int py = id / imageWidth;

        bool insideSrc1 = delta[c_src1 * NUM_SUMS * size + 4 * size + id] != 0;
        bool insideSrc2 = delta[c_src2 * NUM_SUMS * size + 4 * size + id] != 0;

        // Simplify conditional assignments with ternary operator
        float2 pixPos = { 2.0f * px / imageWidth - 1, 2.0f * py / imageHeight - 1 };
        float inputVal = input[id];

        // Pre-calculate indices and input check
        bool validInput = inputVal > 0 && (insideSrc1 || insideSrc2);
        int baseIndex = c_n * NUM_SUMS * size + id;

        // Use conditional execution for all updates 
        delta[baseIndex + 0 * size] = validInput ? inputVal * pixPos.x : 0;
        delta[baseIndex + 1 * size] = validInput ? inputVal * pixPos.y : 0;
        delta[baseIndex + 2 * size] = validInput ? inputVal * pixPos.x * pixPos.x : 0;
        delta[baseIndex + 3 * size] = validInput ? inputVal * pixPos.y * pixPos.y : 0;
        delta[baseIndex + 4 * size] = validInput ? inputVal : 0;
    }
}