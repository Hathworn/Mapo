#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_movinv32_write(char* _ptr, char* end_ptr, unsigned int pattern, unsigned int lb, unsigned int sval, unsigned int offset)
{
    unsigned int* ptr = (unsigned int*) (_ptr + blockIdx.x * BLOCKSIZE);
    unsigned int thread_id = threadIdx.x;

    // Exit early if block's starting address is beyond end_ptr
    if (ptr >= (unsigned int*)end_ptr) {
        return;
    }
    
    unsigned int k = offset + thread_id;  // Offset calculation for each thread
    unsigned int pat = pattern;
    
    // Precompute the number of elements per thread
    unsigned int elements_per_thread = BLOCKSIZE / sizeof(unsigned int) / blockDim.x;
    
    for (unsigned int i = 0; i < elements_per_thread; i++){
        unsigned int index = thread_id * elements_per_thread + i;
        ptr[index] = pat;
        k++;
        if (k >= 32){
            k = 0;
            pat = lb;
        }else{
            pat = pat << 1;
            pat |= sval;
        }
    }

    return;
}