#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSSaturation_backPropagate_kernel(float* x, float* dx, unsigned int size, int shifting, float threshold)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Loop unrolling for potential performance improvement
    for (unsigned int i = index; i < size; i += stride * 4) {
        #pragma unroll // Unrolling the loop for 4 iterations
        for (unsigned int j = 0; j < 4 && i + j < size; ++j) {
            unsigned int idx = i + j;
            if (shifting > 0)
                dx[idx] /= (1 << shifting);
            else if (shifting < 0)
                dx[idx] *= (1 << (-shifting));

            if (threshold != 0.0f) {
                dx[idx] *= (x[idx] > -threshold && x[idx] < threshold) ? 1.0f : 0.0f;
            }
        }
    }
}