#include "hip/hip_runtime.h"
#include "includes.h"
//#define DEBUG
//#define HANDLE_ERROR(x) if((x) != 0) cout << "Error!" << endl;

using namespace std;

struct SubBlock {

    int * nnz_global_i_idx;
    int * nnz_global_o_idx;

    int nnz;
    int * nnz_local_r_idx;
    int * nnz_local_c_idx;
    float * nnz_values;
};

//void printSubBlocksInfo(SubBlock * sbs, int nsbs, int mem_b_size);


// Improved kernel function with minimal operations placeholder 
__global__ void cudaDummy() {
    // Current function does nothing; Stub for future use.
}