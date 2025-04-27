#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compare_2_arrays_kernel(float *one, float *two, int size)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index >= size) return;

    const float val_one = one[index];
    const float val_two = two[index];
    const float diff = 100 * fabs(val_one - val_two) / fabs(val_one);

    // Use conditional to minimize unnecessary printf calls.
    if (diff > 10) 
    {
        printf(" i: %d - one = %f, two = %f, diff = %f %% \n", index, val_one, val_two, diff);
    }
}