#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void applyNormSum(double *dMap, double *dSupFeature, double *dMaxSupFeature, double *dMeanSupFeature, double *dInfFeature, double *dMaxInfFeature, double *dMeanInfFeature, int dSize) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Precompute coeffs outside of loop as they are constant for all elements
    double SupCoeff = (dMaxSupFeature[0] - dMeanSupFeature[0]) * (dMaxSupFeature[0] - dMeanSupFeature[0]);
    double InfCoeff = (dMaxInfFeature[0] - dMeanInfFeature[0]) * (dMaxInfFeature[0] - dMeanInfFeature[0]);

    // Use stride loop for better GPU memory access pattern
    for (int i = tid; i < dSize; i += blockDim.x * gridDim.x) {
        dMap[i] += dSupFeature[i] * SupCoeff + dInfFeature[i] * InfCoeff;
    }
}