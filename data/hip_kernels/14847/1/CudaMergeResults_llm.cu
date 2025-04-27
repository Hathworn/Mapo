#include "hip/hip_runtime.h"
#include "includes.h"
//#define DEBUG
//#define HANDLE_ERROR(x) if((x) != 0) cout << "Error!" << endl;

using namespace std;

struct SubBlock{
    int * nnz_global_i_idx;
    int * nnz_global_o_idx;
    int nnz;
    int * nnz_local_r_idx;
    int * nnz_local_c_idx;
    float * nnz_values;
};

__global__ void CudaMergeResults(SubBlock * d_sbs, float * d_x, float * d_y, int nblocks, int mem_b_size, int nrows, int ncols, float * sub_y_arr) {
    // Define indices for grid-stride loop
    int blockId = blockIdx.x;
    int threadId = threadIdx.x;

    // Use grid-stride loop to distribute the work across threads
    for (int i = blockId; i < nblocks; i += gridDim.x) {
        int *outLocs = d_sbs[i].nnz_global_o_idx;
        for (int j = threadId; j < mem_b_size; j += blockDim.x) {
            atomicAdd(&d_y[outLocs[j] - 1], sub_y_arr[i * mem_b_size + j]);
        }
    }
}