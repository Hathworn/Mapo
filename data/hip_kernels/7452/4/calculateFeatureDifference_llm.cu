#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float computeS(float *sumTable, int rowNumberN, int colNumberM, int startX, int startY, int Kx, int Ky) {
    startX--;
    startY--;
    float S =
    sumTable[startX + Kx + (Ky + startY) * colNumberM] -
    (startX < 0 ? 0 : sumTable[startX + (Ky + startY) * colNumberM]) -
    (startY < 0 ? 0 : sumTable[startX + Kx + startY * colNumberM]) +
    (startX < 0 || startY < 0 ? 0 : sumTable[startX + startY * colNumberM]);
    return S;
}

__global__ void calculateFeatureDifference(float *templateFeatures, int colNumberM, int rowNumberN, float *l1SumTable, float *l2SumTable, float *lxSumTable, float *lySumTable, int Kx, int Ky, float *differences) {
    int widthLimit = colNumberM - Kx + 1;
    int heightLimit = rowNumberN - Ky + 1;

    int startX = threadIdx.x + blockIdx.x * blockDim.x;
    int startY = threadIdx.y + blockIdx.y * blockDim.y;

    // Return if the thread is out of bounds
    if (startX >= widthLimit || startY >= heightLimit) return;

    // Precompute reciprocal of Kx * Ky for reuse
    float reciprocalArea = 1.0f / (Kx * Ky);

    // Compute sums
    float S1D = computeS(l1SumTable, rowNumberN, colNumberM, startX, startY, Kx, Ky);
    float S2D = computeS(l2SumTable, rowNumberN, colNumberM, startX, startY, Kx, Ky);
    float SxD = computeS(lxSumTable, rowNumberN, colNumberM, startX, startY, Kx, Ky);
    float SyD = computeS(lySumTable, rowNumberN, colNumberM, startX, startY, Kx, Ky);

    // Compute mean and variance
    float meanVector = S1D * reciprocalArea;
    float varianceVector = (S2D * reciprocalArea) - powf(meanVector, 2);

    // Compute gradients
    float xCenter = startX + Kx / 2.0f;
    float yCenter = startY + Ky / 2.0f;
    float xGradientVector = 4 * (SxD - xCenter * S1D) / (Kx * Kx * Ky);
    float yGradientVector = 4 * (SyD - yCenter * S1D) / (Ky * Ky * Kx);

    // Store differences using norm4df
    differences[startX + startY * widthLimit] = norm4df(
        templateFeatures[0] - meanVector, 
        templateFeatures[1] - varianceVector,
        templateFeatures[2] - xGradientVector,
        templateFeatures[3] - yGradientVector
    );
}