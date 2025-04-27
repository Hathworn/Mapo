#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sino_uncmprss(unsigned int * dsino, unsigned char * p1sino, unsigned char * d1sino, int ifrm, int nele)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < nele) {
        unsigned int value = dsino[ifrm * nele + idx]; // Cache the repetitive array access
        d1sino[2 * idx] = (unsigned char)((value >> 8) & 0x000000ff);
        d1sino[2 * idx + 1] = (unsigned char)((value >> 24) & 0x000000ff);
        p1sino[2 * idx] = (unsigned char)(value & 0x000000ff);
        p1sino[2 * idx + 1] = (unsigned char)((value >> 16) & 0x000000ff);
    }
}