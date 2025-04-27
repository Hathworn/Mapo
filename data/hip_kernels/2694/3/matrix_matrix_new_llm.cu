#include "hip/hip_runtime.h"
#include "includes.h"

/*
Matrix Matrix multiplication with a single thread for each result element
*/

__global__ void matrix_matrix_new(int *a, int *b, int *c, int n_row, int n_col, int n_comm)
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize loop by calculating indices before loop
    while (tid < n_row * n_col)
    {
        int i = tid / n_col; // calculate row index once
        int j = tid % n_col; // calculate column index once

        int temp = 0;
        for (int k = 0; k < n_comm; ++k)
        {
            temp += a[i * n_comm + k] * b[j + k * n_col];
        }

        c[tid] = temp;
        
        tid += blockDim.x * gridDim.x; // Move to the next segment of work
    }
}