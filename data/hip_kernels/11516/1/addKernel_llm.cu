#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *dev_a, int *dev_b, int *dev_size)
{
    // Use blockIdx.x and blockDim.x to handle larger data by assigning unique index to each thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int size = *dev_size; // Cache dev_size in shared memory
    if (i < size) {
        int temp = 0; // Use a temporary variable to accumulate sum
        for (int j = 0; j < size; j++) {
            int p = size * i + j;
            temp += dev_a[p];
            //printf("%d %d\n", i, p);
        }
        dev_b[i] = temp; // Assign accumulated value to dev_b
    }
}