```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define _USE_MATH_DEFINES

static void CheckCudaErrorAux(const char *, unsigned, const char *,
hipError_t);
#define CUDA_CHECK_RETURN(value) CheckCudaErrorAux(__FILE__,__LINE__, #value, value)

__global__ void convolutionNoTiling(float *I, float *P, int channels, int width, int height) {

    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int depth = threadIdx.z;

    if (col < width && row < height && depth < channels) {

        float pValue = 0.0f;

        int startRow = row - maskRowsRadius;
        int startCol = col - maskColumnsRadius;

        // Optimize loop by precomputing boundaries for ghost elements
        int rowLowerBound = max(0, startRow);
        int rowUpperBound = min(height, startRow + maskRows);
        int colLowerBound = max(0, startCol);
        int colUpperBound = min(width, startCol + maskColumns);

        for (int i = rowLowerBound; i < rowUpperBound; i++) {
            for (int j = colLowerBound; j < colUpperBound; j++) {
                float iValue = I[(i * width + j) * channels + depth];
                pValue += iValue * deviceMaskData[(i - startRow) * maskColumns + (j - startCol)];
            }
        }

        // Save result from register to global
        P[(row * width + col) * channels + depth] = pValue;
    }
}