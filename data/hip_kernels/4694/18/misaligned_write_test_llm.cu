#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void misaligned_write_test(float* a, float* b, float *c, int size, int offset)
{
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    int k = gid + offset;

    if (k < size)
    {
        float val_a = a[gid]; // Preload value from a[gid]
        float val_b = b[gid]; // Preload value from b[gid]
        c[k] = val_a + val_b; // Use preloaded values
    }
}