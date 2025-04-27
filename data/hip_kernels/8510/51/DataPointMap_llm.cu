#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void DataPointMap(int size, const double *inputX, const double *inputY, double *output, const double *inFreeArray, int length) {
    // Use long to avoid overflow in indexing for large sizes
    const long ix = blockDim.x * blockIdx.x + threadIdx.x;
    if (ix < size) {
        // Precompute offsets for input and output arrays
        const long offset = ix * length;
        const double *inArrayBody = inputX + offset;
        double *outArrayBody = output + offset;

        // Unroll loop for potential performance gain
        #pragma unroll
        for (long i = 0; i < length; i++) {
            outArrayBody[i] = inArrayBody[i] + inFreeArray[i];
        }
    }
}