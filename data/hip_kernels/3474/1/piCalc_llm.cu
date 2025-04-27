#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void piCalc(double *area, double width, int rects) {
    // Use registers instead of variables for improved performance
    double mid, height;
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Unroll the loop to reduce overhead
    for (; index < rects; index += blockDim.x * gridDim.x) {
        mid = (index + 0.5) * width; // Calculate midpoint for current index
        height = 4.0 / (1.0 + mid * mid); // Calculate height using original pi algorithm
        area[index] += height; // Accumulate the height to area
    }
}