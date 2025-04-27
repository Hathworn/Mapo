#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DataPointMap(int *size, const double *inputX, const double *inputY, double *output, const double *inFreeArray, int *length) {
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;
    if (ix < *size) {
        const double *inArrayBody = &inputX[ix * *length];
        double *outArrayBody = &output[ix * *length];

        // Unroll the loop for better performance
        for (long i = 0; i < *length; i += 4) {
            if (i + 0 < *length) outArrayBody[i + 0] = inArrayBody[i + 0] + inFreeArray[i + 0];
            if (i + 1 < *length) outArrayBody[i + 1] = inArrayBody[i + 1] + inFreeArray[i + 1];
            if (i + 2 < *length) outArrayBody[i + 2] = inArrayBody[i + 2] + inFreeArray[i + 2];
            if (i + 3 < *length) outArrayBody[i + 3] = inArrayBody[i + 3] + inFreeArray[i + 3];
        }
    }
}