#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernCalcMu(const size_t numPoints, const size_t pointDim, const double* X, const double* loggamma, const double* GammaK, double* dest) {
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= numPoints) {
        return;
    }

    // Cache repeated calculations to reduce redundant computations
    const double gammaExp = exp(loggamma[i]) / exp(*GammaK);
    const double* x = &X[i * pointDim];
    double* y = &dest[i * pointDim];

    // Use shared memory to store pointDim calculations for this thread (optional for large pointDim)
    extern __shared__ double sharedMem[];
    double* sharedX = sharedMem;
    double* sharedY = &sharedMem[pointDim];

    // Load data into shared memory
    for (size_t j = threadIdx.x; j < pointDim; j += blockDim.x) {
        sharedX[j] = x[j];
    }
    __syncthreads();

    // Perform the calculation using shared memory
    for (size_t j = threadIdx.x; j < pointDim; j += blockDim.x) {
        sharedY[j] = gammaExp * sharedX[j];
    }
    __syncthreads();

    // Write results from shared memory back to global memory
    for (size_t j = threadIdx.x; j < pointDim; j += blockDim.x) {
        y[j] = sharedY[j];
    }
}