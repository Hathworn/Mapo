#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int position;            // index of the largest value
__device__ int largest;             // value of the largest value
int lenString = 593;
int maxNumStrings = 1000000;
int threshold = 2;

__device__ void cuda_select(int *db, int size) {
    int my_id = blockDim.x * blockIdx.x + threadIdx.x;

    if(my_id < size) {
        int idx1 = 2 * my_id;
        int idx2 = idx1 + 1;
        db[my_id] = db[idx1] > db[idx2] ? db[idx1] : db[idx2]; // Use conditional operator
    }
}

__global__ void select(int *db, int size) {
    extern __shared__ int shared_db[]; // Use shared memory for increased performance
    int tid = threadIdx.x;
    int numThreads = blockDim.x;
    int height = (int)ceil(log2((double)size));
    
    for(int i = 0; i < height; i++) {
        if(tid < size) {
            shared_db[tid] = db[tid];
        }
        __syncthreads();  // Synchronize threads
        
        if(tid < size / 2) {
            int idx1 = 2 * tid;
            int idx2 = idx1 + 1;
            shared_db[tid] = shared_db[idx1] > shared_db[idx2] ? shared_db[idx1] : shared_db[idx2];
        }
        __syncthreads();

        if(tid < size / 2) {
            db[tid] = shared_db[tid];
        }
        size = (int)ceil((double)size / 2);
    }
    
    if(tid == 0) {
        largest = db[0];
    }
}