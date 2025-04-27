#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kEltwiseLogregCost(float* predmap, float* indmap, float* indlogpred, float* correctprobs, int numCases, int numTasks, int per_thread_case) {
    const int task_id = blockIdx.x;
    const int start_tx = threadIdx.x * per_thread_case;
    const int end_tx = min(start_tx + per_thread_case, numCases);
    const float EPSILON = 1e-20f; // Minimum value allowed, avoid log( 0 )

    // Return early if task_id is out of bounds
    if (task_id >= numTasks) {
        return;
    }

    for (int c_id = start_tx; c_id < end_tx; ++c_id) {
        int pos = task_id * numCases + c_id;
        float pred_value = predmap[pos];
        float t = __fdividef(1.0f, 1.0f + __expf(-pred_value)); // Calculate logistic sigmoid

        // Use branchless approach to handle 'indmap == 1' condition
        float is_indmap_one = indmap[pos] * 2.0f - 1.0f; // -1.0f if 0, 1.0f if 1
        float adjusted_t = (1.0f + is_indmap_one) * t - is_indmap_one; // Efficient conditional calculation

        // Ensure adjusted_t is not less than EPSILON
        adjusted_t = fmaxf(adjusted_t, EPSILON);

        // Calculate log probability and store
        indlogpred[pos] = __logf(adjusted_t);

        // Store the final correct probability
        correctprobs[pos] = adjusted_t;
    }
}