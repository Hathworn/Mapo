#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"
__global__ void copy_u2l_dense(double* ret, int dim, int N) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    if (iy < dim && ix < iy && iy * dim + ix < N) { // Bounds check and axis swap condition
        int id_dest = iy * dim + ix;
        int id_src = ix * dim + iy;
        ret[id_dest] = ret[id_src];
    }
}
```
