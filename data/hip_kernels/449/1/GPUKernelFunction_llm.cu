#include "hip/hip_runtime.h"
#include "includes.h"
/* ==================================================================
Programmers:
Kevin Wagner
Elijah Malaby
John Casey

Omptimizing SDH histograms for input larger then global memory
==================================================================
*/

#define BOX_SIZE 23000 /* size of the data box on one dimension */

/* descriptors for single atom in the tree */
typedef struct atomdesc {
    float x_pos;
    float y_pos;
    float z_pos;
} atom;

unsigned long long * histogram;	/* list of all buckets in the histogram */
unsigned long long  PDH_acnt;	/* total number of data points */
int block_size;	/* Number of threads per block */
int num_buckets;	/* total number of buckets in the histogram */
float PDH_res;	/* value of w */
atom * atom_list;	/* list of all data points */
unsigned long long * histogram_GPU;
unsigned long long * temp_histogram_GPU;
atom * atom_list_GPU;

__device__ void block_to_block (atom * block_a, atom * block_b, int b_length, unsigned long long * histogram, float resolution) {
    atom me = block_a[threadIdx.x];
    for (int i = 0; i < b_length; i++) {
        float dx = me.x_pos - block_b[i].x_pos;
        float dy = me.y_pos - block_b[i].y_pos;
        float dz = me.z_pos - block_b[i].z_pos;
        int bin = (int)(sqrt(dx * dx + dy * dy + dz * dz) / resolution);
        atomicAdd(&(histogram[bin]), 1);
    }
}

__global__ void GPUKernelFunction (unsigned long long PDH_acnt, float PDH_res, atom * atom_list_GPU, unsigned long long * histogram_GPU, int num_buckets) {
    extern __shared__ unsigned long long SHist[];
    // initialize shared memory histogram
    for (int h_pos = threadIdx.x; h_pos < num_buckets; h_pos += blockDim.x) {
        SHist[h_pos] = 0;
    }
    __syncthreads();

    // get atoms for the current block
    atom * my_block = &atom_list_GPU[blockIdx.x * blockDim.x];
    atom temp_atom_1 = my_block[threadIdx.x];

    // compute distances within the block
    for (int i = threadIdx.x + 1; i < blockDim.x && i + blockIdx.x * blockDim.x < PDH_acnt; i++) {
        atom temp_atom_2 = my_block[i];
        float dx = temp_atom_1.x_pos - temp_atom_2.x_pos;
        float dy = temp_atom_1.y_pos - temp_atom_2.y_pos;
        float dz = temp_atom_1.z_pos - temp_atom_2.z_pos;
        int h_pos = (int)(sqrt(dx * dx + dy * dy + dz * dz) / PDH_res);
        atomicAdd(&(SHist[h_pos]), 1);
    }
    __syncthreads();

    // compute distances between different blocks
    for (int i = blockIdx.x + 1; i < gridDim.x - 1; i++) {
        block_to_block(my_block, &atom_list_GPU[i * blockDim.x], blockDim.x, SHist, PDH_res);
    }
    block_to_block(my_block, &atom_list_GPU[i * blockDim.x], PDH_acnt - i * blockDim.x, SHist, PDH_res); // Last block may be small

    __syncthreads();

    // update global histogram
    for (int h_pos = threadIdx.x; h_pos < num_buckets; h_pos += blockDim.x) {
        atomicAdd(histogram_GPU + blockIdx.x * num_buckets + h_pos, SHist[h_pos]);
    }
}
```
