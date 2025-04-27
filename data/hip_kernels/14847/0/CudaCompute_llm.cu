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

__global__ void CudaCompute(SubBlock * d_sbs, float * d_x, float * d_y, int nblocks, int mem_b_size, int nrows, int ncols , float * sub_y_arr) {
    int blockId = blockIdx.x;
    if (blockId >= nblocks) return;

    SubBlock * work_sb = &d_sbs[blockId];

    extern __shared__ float shared_mem[];
    float * x_sub = shared_mem;
    float * y_sub = shared_mem + mem_b_size;

    // Load x_sub
    for (int i = threadIdx.x; i < mem_b_size; i += blockDim.x) {
        int global_i_idx = work_sb->nnz_global_i_idx[i];
        x_sub[i] = (global_i_idx > 0 && global_i_idx <= ncols) ? d_x[global_i_idx - 1] : 0.0f;
    }
    __syncthreads();

    // Compute y_sub
    for (int i = threadIdx.x; i < work_sb->nnz; i += blockDim.x) {
        int x_sub_idx = work_sb->nnz_local_c_idx[i] - 1;
        int y_sub_idx = work_sb->nnz_local_r_idx[i] - 1;
        atomicAdd(&y_sub[y_sub_idx], work_sb->nnz_values[i] * x_sub[x_sub_idx]);
    }
    __syncthreads();

    // Store result in sub_y_arr
    for (int i = threadIdx.x; i < mem_b_size; i += blockDim.x) {
        sub_y_arr[blockId * mem_b_size + i] = y_sub[i];
    }
}