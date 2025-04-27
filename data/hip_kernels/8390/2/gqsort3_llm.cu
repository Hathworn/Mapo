#include "hip/hip_runtime.h"
#include "includes.h"
#define MAXR(sz) (((sz)+MAXSEQ-1)/MAXSEQ+1)
#define MAXT MAXR(MAXN)
int MAXN;
int MAXSEQ;
int THRN;

//===Definicion de estructuras y funciones utiles===

typedef struct secuence{
    int start,end,pivot;
}secuence;

typedef struct block{
    secuence seq,parent;
    int blockcount,id,bid;
}block;

__global__ void gqsort3(block * blocks, int * d, int * _d) {
    int id = blockIdx.x, th = threadIdx.x, cth = blockDim.x;
    int start = blocks[id].seq.start, end = blocks[id].seq.end;

    // Use shared memory to improve performance
    __shared__ int sdata[1024]; // Assuming a max of 1024 threads per block
    if (th < (end - start)) {
        sdata[th] = _d[start + th]; // Load data to shared memory
    }
    __syncthreads();

    for (int j = start + th; j < end; j += cth) {
        // Access shared memory instead of global memory
        d[j] = sdata[j - start];
    }

    return;
}