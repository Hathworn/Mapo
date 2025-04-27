```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void divergence_test_ker()
{
    int idx = threadIdx.x;  // Cache thread index
    bool is_even = (idx % 2 == 0);  // Compute and store condition result

    // Minimize divergence by grouping similar branches
    if (is_even) {
        printf("threadIdx.x %d : This is an even thread.\n", idx);
    } else {
        printf("threadIdx.x %d : This is an odd thread.\n", idx);
    }
}