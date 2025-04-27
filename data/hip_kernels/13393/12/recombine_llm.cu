#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void recombine(unsigned int *p0, unsigned int *p1, unsigned int *off, unsigned int cols) {
    unsigned int tid = threadIdx.y * blockDim.x + threadIdx.x;
    unsigned int boffset = blockIdx.x * blockDim.x + tid;

    if (boffset < cols) { // Only perform operations if within bounds
        unsigned int p = p0[boffset];
        unsigned int q = p1[boffset];
        unsigned int res = off[boffset];

        // Use bitwise operations to compute the result
        res = ((p & ~res) | (q & res));
        off[boffset] = res; // Write back the result
    }
}