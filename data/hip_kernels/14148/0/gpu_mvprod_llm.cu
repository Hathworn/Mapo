#include "hip/hip_runtime.h"
#include "includes.h"

// number of threads in a block (must be multiple of 32)
#define NUMTHREADS 128

// the maximum size of the grid
#define GRIDSIZE 65535

// Helper macro to check CUDA return values
__global__ void gpu_mvprod(double *x, double *y, double alpha, int NumUp, int NumDown, int dim, double *Umat, double *Down_data,unsigned int *Down_ind, int size_Down, double *Up_data, unsigned int *Up_ind, int size_Up, int rows_shared)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if(index < dim)
    {
        double result = Umat[index] * x[index];

        int sv = index / NumDown;
        int id = index % NumDown;

        extern __shared__ double shared[];

        unsigned int *shared_ind = (unsigned int *) &shared[size_Up * rows_shared];

        int s_sv = blockIdx.x * blockDim.x / NumDown;

        // Use coalesced access pattern for shared memory initialization
        if(threadIdx.x < rows_shared && (s_sv + threadIdx.x) < NumUp)
        {
            for(int i = 0; i < size_Up; i++)
            {
                shared[i * rows_shared + threadIdx.x] = Up_data[s_sv + threadIdx.x + i * NumUp];
                shared_ind[i * rows_shared + threadIdx.x] = Up_ind[s_sv + threadIdx.x + i * NumUp];
            }
        }

        __syncthreads();

        for(int i = 0; i < size_Up; i++)
        {
            result += shared[sv - s_sv + i * rows_shared] * x[id + NumDown * shared_ind[sv - s_sv + i * rows_shared]];
        }

        for(int i = 0; i < size_Down; i++)
        {
            result += Down_data[id + i * NumDown] * x[sv * NumDown + Down_ind[id + i * NumDown]];
        }

        y[index] = alpha * y[index] + result;
    }
}