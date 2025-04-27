#include "hip/hip_runtime.h"
#include "includes.h"
#define MAXR(sz) (((sz)+MAXSEQ-1)/MAXSEQ+1)
#define MAXT MAXR(MAXN)
int MAXN;
int MAXSEQ;
int THRN;

typedef struct secuence{
    int start,end,pivot;
} secuence;

typedef struct block{
    secuence seq,parent;
    int blockcount,id,bid;
} block;

__global__ void gqsort1(block * blocks, int * d, int * LT, int * GT) {
    // Calculate unique thread id across all blocks
    int global_id = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = gridDim.x * blockDim.x;

    int gt = 0, lt = 0;
    int pivot, start, end;

    if (threadIdx.x == 0) {
        pivot = blocks[blockIdx.x].seq.pivot;
        start = blocks[blockIdx.x].seq.start;
        end = blocks[blockIdx.x].seq.end;
        LT[blockIdx.x] = 0;
        GT[blockIdx.x] = 0;
    }

    __syncthreads();

    // Distribute the workload evenly across all threads
    int index = start + global_id;
    while (index < end) {
        if (d[index] < pivot) {
            lt++;
        } else if (d[index] > pivot) {
            gt++;
        }
        index += total_threads;  // Move to the next work item for this thread
    }

    // Use atomic operations to avoid race conditions
    atomicAdd(&LT[blockIdx.x], lt);
    atomicAdd(&GT[blockIdx.x], gt);
}