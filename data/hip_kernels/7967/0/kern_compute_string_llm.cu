#include "hip/hip_runtime.h"
#include "includes.h"

#define MEMSIZE 30

/* Function computing the final string to print */
__global__ void kern_compute_string(char *res, char *a, char *b, char *c, int length)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    if (i < length)
    {
        res[i] = a[i] + b[i] + c[i]; // Perform computations on in-bounds index
    }
}