#include "hip/hip_runtime.h"
#include "includes.h"

/*------------------------GPU RANKING----------------------------------------START-------*/

/*------------------------shfl_scan_test-----------------------------------------------Start*/
/*------------------------shfl_scan_test-----------------------------------------------End*/
/*------------------------Final Ranking-----------------------------------------------Start*/

/*------------------------Final_ranking-----------------------------------------------End*/

/*-----------------------GPU RANKING------------------------------------------END--------*/

/*-----------------------iDivUp--------------------------------------------------------Start*/

__global__ void final_ranking(float *data, int *rank, float *partial_data, int *partial_rank, int len) {
    extern __shared__ float shared_buf[]; // Use shared memory dynamically
    float &value_buf = shared_buf[0]; // First element for value
    int &rank_buf = *((int*) &shared_buf[1]); // Second element for rank

    int id = ((blockIdx.x * blockDim.x) + threadIdx.x);
    if (id >= len) return; // Correct condition for valid index

    if (threadIdx.x == 0) {
        value_buf = partial_data[blockIdx.x];
        rank_buf = partial_rank[blockIdx.x];
    }
    __syncthreads(); // Ensure all threads see the updated values

    if (data[id] == value_buf) {
        rank[id] = rank_buf;
    }
}