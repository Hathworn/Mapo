#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcul_min(unsigned long *ord, int ind_start, int ind_end, unsigned long long *ymin, int *ind_min, int size_max_parallel) {

    int a = threadIdx.x;
    int size_tot = (ind_end - ind_start - 1);

    // Adjusting the number of threads and size parallel computation
    int nb_threads = (size_tot + size_max_parallel - 1) / size_max_parallel;
    int size_parallel = (size_tot + nb_threads - 1) / nb_threads; 

    int ind_start_loc = ind_start + a * size_parallel + 1;

    if (a == (nb_threads - 1)) 
        size_parallel = size_tot - a * size_parallel;

    unsigned long min_loc = ord[ind_start_loc];
    int ind_min_loc = ind_start_loc;

    // Finding local minimum in the assigned subarray
    for (int i = ind_start_loc; i < ind_start_loc + size_parallel; i++) {
        if (ord[i] < min_loc) { 
            min_loc = ord[i];
            ind_min_loc = i;
        }
    }

    // Atomic operation to find the global minimum across all threads
    atomicMin(ymin, min_loc); 

    __syncthreads();

    // Atomically update the global index of the minimum value
    if (*ymin == min_loc) {
        atomicExch(ind_min, ind_min_loc);
    }

    return;
}