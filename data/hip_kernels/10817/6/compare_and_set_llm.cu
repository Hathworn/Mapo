#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel for better performance
extern "C"
__global__ void compare_and_set(double* A, double* ret, int rlen, int clen, double compareVal, double tol, double ifEqualsVal, double ifLessThanVal, double ifGreaterThanVal) {
    // Calculate global thread index
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds
    if (ix < rlen && iy < clen) {
        int index = ix * clen + iy;

        // Calculate the difference once to avoid repetitive calculation
        double diff = A[index] - compareVal;

        // Use ternary operator for concise conditional assignment
        ret[index] = (abs(diff) < tol) ? ifEqualsVal : (diff < 0) ? ifLessThanVal : ifGreaterThanVal;
    }
}