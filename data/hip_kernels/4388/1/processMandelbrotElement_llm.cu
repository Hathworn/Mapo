#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned int doIterations(double const realPart0, double const imagPart0, unsigned int const maxIters) {
    // Initialise: z = z0
    double realPart = realPart0;
    double imagPart = imagPart0;
    unsigned int count = 0;
    // Loop until escape
    while ((count <= maxIters) && (realPart*realPart + imagPart*imagPart <= 4.0)) {
        ++count;
        // Update: z = z*z + z0;
        double const oldRealPart = realPart;
        realPart = realPart * realPart - imagPart * imagPart + realPart0;
        imagPart = 2.0 * oldRealPart * imagPart + imagPart0;
    }
    return count;
}

__device__ size_t calculateGlobalIndex() {
    // Calculate global thread index directly
    size_t const globalThreadIdx = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * (blockIdx.x + blockIdx.y * gridDim.x));
    return globalThreadIdx;
}

__global__ void processMandelbrotElement(double *out, const double *x, const double *y, const unsigned int maxIters, const unsigned int numel) {
    // Calculate global thread index
    size_t const globalThreadIdx = calculateGlobalIndex();

    // Check thread bounds
    if (globalThreadIdx >= numel) return;

    // Process coordinates and execute iterations
    double const realPart0 = x[globalThreadIdx];
    double const imagPart0 = y[globalThreadIdx];
    unsigned int const count = doIterations(realPart0, imagPart0, maxIters);
    out[globalThreadIdx] = log(double(count + 1));
}