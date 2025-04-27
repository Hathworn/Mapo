#include "hip/hip_runtime.h"
#include "includes.h"
/* CUDA API header files */


extern "C"
__global__ void matrixMult(const double *Md, const double *Nd, double *Pd, int size)
{
    // Use shared memory to optimize memory access
    __shared__ double Mds[16][16];
    __shared__ double Nds[16][16];

    int row = blockDim.x * blockIdx.x + threadIdx.x;
    int col = blockDim.y * blockIdx.y + threadIdx.y;
    
    double Pvalue = 0.0;

    for (int k = 0; k < (size + 15) / 16; ++k) {
        // Load Md and Nd into shared memory
        if (k * 16 + threadIdx.x < size && row < size)
            Mds[threadIdx.y][threadIdx.x] = Md[row + (k * 16 + threadIdx.x) * size];
        else
            Mds[threadIdx.y][threadIdx.x] = 0.0;

        if (k * 16 + threadIdx.y < size && col < size)
            Nds[threadIdx.y][threadIdx.x] = Nd[col * size + k * 16 + threadIdx.y];
        else
            Nds[threadIdx.y][threadIdx.x] = 0.0;

        // Synchronize to make sure the sub-matrices are loaded
        __syncthreads();

        // Multiply the loaded matrices
        for (int n = 0; n < 16; ++n)
            Pvalue += Mds[threadIdx.y][n] * Nds[n][threadIdx.x];

        // Synchronize to make sure that computation is done before the next sub-matrix is loaded
        __syncthreads();
    }

    // Write the result
    if (row < size && col < size)
        Pd[col * size + row] = Pvalue;
}