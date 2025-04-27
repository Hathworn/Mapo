#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InsertionSortDistances(float* dist, int* idMat, int n, int k)
{
    // Get the index of the column that the current thread is responsible for
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // If col is out of bounds, then do nothing
    if (col < n)
    {
        int* id = &idMat[col * n];
        id[0] = 0;

        float* distCol = &dist[col * n];

        // Optimized sorting of column 'col'
        for (int i = 1; i < n; ++i)
        {
            float x = distCol[i];
            int currIndex = i;
            int j = i - 1;
            while (j >= 0 && distCol[j] > x)
            {
                distCol[j + 1] = distCol[j];
                id[j + 1] = id[j];
                --j;
            }
            distCol[j + 1] = x;
            id[j + 1] = currIndex;
        }
    }
}