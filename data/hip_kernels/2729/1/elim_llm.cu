#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
#define TILE 16

__global__ void elim(double *A, int n, int index, int bsize) {
    extern __shared__ double pivot[];

    int idThread = threadIdx.x;
    int idBlock = blockIdx.x;
    int blockSize = bsize;
    
    // Load pivot row into shared memory by first thread in block
    if (idThread == 0) {
        for (int i = index; i < n; i++) {
            pivot[i] = A[index * n + i];
        }
    }

    __syncthreads();

    // Calculate current row and start indices
    int currentRow = ((blockSize * idBlock) + idThread) * n;
    int start = currentRow + index;

    // Perform elimination if the current row is below the pivot row
    if (currentRow > index * n) {
        double startVal = A[start];
        for (int i = start + 1; i < currentRow + n; ++i) {
            A[i] -= startVal * pivot[i - currentRow];
        }
    }
}