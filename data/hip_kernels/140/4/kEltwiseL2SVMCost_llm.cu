#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kEltwiseL2SVMCost(float* ydata, float* ldata, float* pre_grad, float* all_cost, float a, float b, int numCases, int numTasks, int per_thread_case) {
    const int task_id = blockIdx.x;
    const int start_tx = threadIdx.x * per_thread_case;
    const int end_tx = min(start_tx + per_thread_case, numCases);
    
    if (task_id >= numTasks) {
        return;
    }
    
    // Precompute the base index to reduce redundant calculations
    int base_pos = task_id * numCases;

    for (int c_id = start_tx; c_id < end_tx; ++c_id) {
        int pos = base_pos + c_id;
        float yldata_diff = ldata[pos] - b; // Share load into memory
        float tmp = fmaxf(a - ydata[pos] * yldata_diff, 0);
        
        pre_grad[pos] = tmp;
        all_cost[pos] = tmp * tmp;
    }
}