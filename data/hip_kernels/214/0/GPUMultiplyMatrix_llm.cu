#include "hip/hip_runtime.h"
#include "includes.h"

const int NUMTHREADS = 1024;
int startNodeNumber;
int endNodeNumber;

typedef struct lList {
    int path[50];
    struct lList *next;
} lList;

__global__ void GPUMultiplyMatrix(long *matrix1, long *matrix2, int paths, int count) {
    int element = blockIdx.x * blockDim.x + threadIdx.x;
    if (element >= count * count) return; // Boundary check

    int col = element % count;
    int row = element / count;

    while (paths > 0) {
        long sum = 0;

        // Optimize using local variables
        for (int i = 0; i < count; i++) {
            long m1_val = matrix1[count * i + col];
            long m2_val = matrix2[row * count + i];
            sum += m1_val * m2_val;
        }

        // Store result directly to memory to avoid overwriting if multiple paths
        __syncthreads(); // Sync before writing
        matrix2[element] = sum;

        paths--;
    }
}