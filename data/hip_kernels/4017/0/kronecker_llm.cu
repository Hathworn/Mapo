#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kronecker(double * a, int nax, int nay, double * b, int nbx, int nby, double * result) {
    // Calculate the global position of the thread
    int tPosX = blockIdx.x * blockDim.x + threadIdx.x;
    int tPosY = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate dimensions of the result matrix
    int resSzx = nax * nbx;

    // Compute indices for matrices a and b
    int idxA = tPosX / nbx;
    int idyA = tPosY / nby;
    int idxB = tPosX % nbx;
    int idyB = tPosY % nby;

    // Ensure indices are within valid ranges for a and b
    if (idxA < nax && idyA < nay && idxB < nbx && idyB < nby) {
        // Store the multiplied result
        result[tPosX + tPosY * resSzx] = a[idyA * nax + idxA] * b[idyB * nbx + idxB];
    }
}
```
