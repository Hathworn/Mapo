#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitonic_sort_step(unsigned int *dev_values, int j, int k) {
    unsigned int i = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int ixj = i ^ j;

    // Check if the threads have valid sorting partners
    if (ixj > i) {
        // Determine whether to sort ascending or descending based on bitwise comparison
        bool shouldSortAscending = (i & k) == 0;

        // Use a ternary operation to reduce redundant code
        unsigned int temp = dev_values[i];
        bool condition = (dev_values[i] > dev_values[ixj]);
        
        // Use conditional statements to perform sorting
        if (shouldSortAscending && condition) {
            dev_values[i] = dev_values[ixj];
            dev_values[ixj] = temp;
        } else if (!shouldSortAscending && !condition) {
            dev_values[i] = dev_values[ixj];
            dev_values[ixj] = temp;
        }
    }
}