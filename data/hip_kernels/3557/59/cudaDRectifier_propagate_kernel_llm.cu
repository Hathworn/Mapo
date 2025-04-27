#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDRectifier_propagate_kernel(double* x, double* y, unsigned int size, double leakSlope, double clipping)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop optimization with unrolling
    for (unsigned int i = index; i < size; i += stride * 4) {
        double value1 = x[i];
        double value2 = (i + stride < size) ? x[i + stride] : 0.0;  // Bounds check
        double value3 = (i + stride * 2 < size) ? x[i + stride * 2] : 0.0;  // Bounds check
        double value4 = (i + stride * 3 < size) ? x[i + stride * 3] : 0.0;  // Bounds check

        if (clipping > 0.0) {
            y[i] = (value1 > 0.0) ? min(value1, clipping) : leakSlope * value1;
            if (i + stride < size)
                y[i + stride] = (value2 > 0.0) ? min(value2, clipping) : leakSlope * value2;
            if (i + stride * 2 < size)
                y[i + stride * 2] = (value3 > 0.0) ? min(value3, clipping) : leakSlope * value3;
            if (i + stride * 3 < size)
                y[i + stride * 3] = (value4 > 0.0) ? min(value4, clipping) : leakSlope * value4;
        } else {
            y[i] = (value1 > 0.0) ? value1 : leakSlope * value1;
            if (i + stride < size)
                y[i + stride] = (value2 > 0.0) ? value2 : leakSlope * value2;
            if (i + stride * 2 < size)
                y[i + stride * 2] = (value3 > 0.0) ? value3 : leakSlope * value3;
            if (i + stride * 3 < size)
                y[i + stride * 3] = (value4 > 0.0) ? value4 : leakSlope * value4;
        }
    }
}