#include "hip/hip_runtime.h"
#include "includes.h"

/**********************************
When updating a kernel or adding a new one,
please compile the ptx file and commit it:
nvcc -ptx -arch=sm_30 SystemML.cu
***********************************/

/**
* Performs a slice operation where the input matrix is sparse and the output matrix is dense.
* This function avoids unnecessary sparse to dense conversion of the input matrix.
* Parallelization: rows of output matrix.
*
* @params inVal input val pointer
* @params inRowPtr input row pointer
* @params colInd input col index pointer
* @params ret dense output pointer
* @param rl row lower
* @param ru row upper
* @param cl column lower
* @param cu column upper
* @param retClen number of columns of output matrix
*/
extern "C"

/**
* Performs a slice operation where the input matrix is sparse and the output matrix is dense.
* This function avoids unnecessary sparse to dense conversion of the input matrix.
* Parallelization: subset of number of non-zeroes of input matrix.
*
* @params inVal input val pointer
* @params inRowPtr input row pointer
* @params colInd input col index pointer
* @params ret dense output pointer
* @param rl row lower
* @param ru row upper
* @param cl column lower
* @param cu column upper
* @param retClen number of columns of output matrix
*/
extern "C"

/**
* Performs a slice operation where the input matrix is dense and the output matrix is dense.
*
* @params in dense input pointer
* @params ret dense output pointer
* @param rl row lower
* @param ru row upper
* @param cl column lower
* @param cu column upper
* @param inClen number of columns of input matrix
* @param retRlen number of rows of output matrix
* @param retClen number of columns of output matrix
*/
extern "C"


/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"

extern "C"
__global__ void copy_u2l_dense(double* ret, int dim, int N) {
    // Efficiently map only the necessary threads
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    if (ix >= dim) return;
    
    for (int iy = ix + 1; iy < dim; ++iy) {
        int id_dest = iy * dim + ix;
        if (id_dest < N) {
            int id_src = ix * dim + iy;
            ret[id_dest] = ret[id_src];
        }
    }
}