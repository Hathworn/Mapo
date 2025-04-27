#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SortDistances(float* dist, int* idMat, int n, int k)
{
    // Get the index of the column that the current thread is responsible for
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // IF col is out of bounds, then do nothing
    if(col < n)
    {
        int* id = &idMat[col * n];
        for(int i = 0; i < n; ++i)
            id[i] = i;

        float* distCol = &dist[col * n];
        // Only care about the first k elements being sorted
        for (int i = 0; i < k; ++i)
        {
            int minIndex = i;
            float minValue = distCol[i];

            // Optimize by reducing redundant memory access
            for (int j = i + 1; j < n; ++j)
            {
                if(distCol[j] < minValue)
                {
                    minIndex = j;
                    minValue = distCol[j];
                }
            }
            if(minIndex != i)
            {
                // Swap distCol
                distCol[minIndex] = distCol[i];
                distCol[i] = minValue;

                // Swap ids
                int tmpId = id[minIndex];
                id[minIndex] = id[i];
                id[i] = tmpId;
            }
        }
    }
}