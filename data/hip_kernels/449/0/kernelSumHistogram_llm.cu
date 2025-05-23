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

unsigned long long * histogram;		/* list of all buckets in the histogram */
unsigned long long  PDH_acnt;	    /* total number of data points */
int block_size;		                /* Number of threads per block */
int num_buckets;	                /* total number of buckets in the histogram */
float   PDH_res;	                /* value of w */
atom * atom_list;	                /* list of all data points */
unsigned long long * histogram_GPU;
unsigned long long * temp_histogram_GPU;
atom * atom_list_GPU;

__global__ void kernelSumHistogram(unsigned long long int *InputHists, unsigned long long int *hist, int num_atoms, int num_buckets, int block_size) {
    unsigned int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int h_pos = tid;
    const unsigned int totalThreads = blockDim.x * gridDim.x;
    
    // Calculate the number of loops for summation
    unsigned int NumberOfSumLoop = (num_atoms + block_size - 1) / block_size;
    
    while (h_pos < num_buckets) {
        unsigned long long int tmpAns = 0;
        
        // Unroll the loop for better performance
        for (int i = 0; i < NumberOfSumLoop; i++) {
            tmpAns += *(InputHists + (i * num_buckets) + h_pos);
        }
        
        hist[h_pos] = tmpAns;
        h_pos += totalThreads;
    }
}
```
