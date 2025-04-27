#include "hip/hip_runtime.h"
#include "includes.h"
int row = 0;
int col = 0;
using namespace std;

__global__ void gpu_transpose(float *dst, float *A, int col, int row) {
    // Calculate the global index for the row and column
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Use threads to handle both dimensions for better parallelism
    if(x < col && y < row) {
        dst[y * col + x] = A[x * row + y];
    }
}
```
