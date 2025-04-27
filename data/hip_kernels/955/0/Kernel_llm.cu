#include "hip/hip_runtime.h"
#include "includes.h"

#define TIME                5.
#define TIME_STEP           .1

#define STEP                1.
#define K                   TIME_STEP / SQUARE(STEP)

#define SQUARE(x)           (x * x)
#define HANDLE_ERROR(err)   (HandleError(err, __FILE__, __LINE__))

__global__ void Kernel(double * device, const uint size)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use shared memory for temporary storage if applicable
    __shared__ double temp[blockDim.x];
    
    // Ensure processing within bounds
    if (i >= size) return;

    double left, center, right;
    if (i > 0) {
        left = device[i - 1];
    }
    
    center = device[i];

    if (i < size - 1) {
        right = device[i + 1];
    }

    // Reduce conditional check; compute values based on valid indices
    if (i == 0) {
        device[i] = .0;
    } else if (i == size - 1) {
        device[size - 1] = device[size - 2] + 5 * STEP;
    } else {
        // Apply finite difference method
        device[i] = (right - 2.0 * center + left) * K + center;
    }
}