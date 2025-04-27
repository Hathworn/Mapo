#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDSaturation_backPropagate_kernel(double* x, double* dx, unsigned int size, int shifting, double threshold)
{
    // Calculate the flattened global index
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use shared memory for performance improvement in case it's being reused
    extern __shared__ double shared_dx[];

    if (index < size) {
        // Precompute shift values to reduce branching
        double shift_value = 1;
        if (shifting > 0) {
            shift_value = 1.0 / (1 << shifting);
        } else if (shifting < 0) {
            shift_value = 1 << (-shifting);
        }

        // Iterate over all elements this thread is responsible for
        for (unsigned int i = index; i < size; i += stride) {
            dx[i] *= shift_value;
            if (threshold != 0.0) {
                dx[i] *= (x[i] > -threshold && x[i] < threshold) ? 1.0 : 0.0;
            }
        }
    }
}