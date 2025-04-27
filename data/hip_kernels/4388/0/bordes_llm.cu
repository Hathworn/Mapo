#include "hip/hip_runtime.h"
#include "includes.h"

#define Columnas 10
#define Filas 10
hipError_t addWithCuda(int* c, const int* a, unsigned int size);

__device__ unsigned int computeOutputEdge(int mask[][3], int vecinos[][3], int rows, int cols) {
    int sum = 0;
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            sum += mask[i][j] * vecinos[i][j];
        }
    }
    return abs(sum);
}

__global__ void bordes(int* val2, const int* val1, int m, int n) {

    int column = threadIdx.x + blockDim.x * blockIdx.x;
    int row = threadIdx.y + blockDim.y * blockIdx.y;

    int myEdge[3][3] = { {0,1,0},{1,-4,1},{0,1,0} };

    // Ensure we only run for valid rows and columns
    if (row > 0 && row < m - 1 && column > 0 && column < n - 1) {
        int thread_id1 = (row - 1) * n + (column - 1);
        int thread_id2 = (row - 1) * n + column;
        int thread_id3 = (row - 1) * n + (column + 1);
        int thread_id4 = row * n + (column - 1);
        int thread_id5 = row * n + column;
        int thread_id6 = row * n + (column + 1);
        int thread_id7 = (row + 1) * n + (column - 1);
        int thread_id8 = (row + 1) * n + column;
        int thread_id9 = (row + 1) * n + (column + 1);

        // Access matrix values in shared memory to reduce global memory pressure
        int myMask2[3][3] = {
            { val1[thread_id1], val1[thread_id2], val1[thread_id3] },
            { val1[thread_id4], val1[thread_id5], val1[thread_id6] },
            { val1[thread_id7], val1[thread_id8], val1[thread_id9] }
        };

        unsigned int output = computeOutputEdge(myEdge, myMask2, 3, 3);
        val2[thread_id5] = output;
    }
    // Handle edge cases by retaining original values
    else if (row < m && column < n) {
        val2[row * n + column] = val1[row * n + column];
    }
}
```
