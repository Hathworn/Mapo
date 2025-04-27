#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDRectifier_propagate_kernel(double* x, double* y, unsigned int size, double leakSlope, int shifting, double clipping)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce redundant global memory access
    __shared__ double shared_clipping;
    __shared__ int shared_shifting;
    __shared__ double shared_leakSlope;

    if (threadIdx.x == 0) {
        shared_clipping = clipping;
        shared_shifting = shifting;
        shared_leakSlope = leakSlope;
    }
    __syncthreads();

    for (unsigned int i = index; i < size; i += stride) {
        double value = x[i];

        // Precompute shifting effect
        if (shared_shifting != 0) {
            value = shared_shifting > 0 ? value / (1 << shared_shifting) : value * (1 << (-shared_shifting));
        }

        // Optimize conditional assignment using shared memory
        if (shared_clipping > 0.0) {
            y[i] = (value > 0.0) ? min(value, shared_clipping) : shared_leakSlope * value;
        } else {
            y[i] = (value > 0.0) ? value : shared_leakSlope * value;
        }
    }
}