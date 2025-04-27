#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateGradInputLSM(const float* target, const float* mapping, const float* n_class_in_cluster, float* class_score, float* class_logsum, float* cluster_score, float* cluster_logsum, const long class_score_stride0, const long cluster_score_stride0, int n_clusters) {
    const int tidx = threadIdx.x;
    const int nthreads = blockDim.x;

    const int itarget = static_cast<int>(target[blockIdx.x] - 0.5f);      // Enhanced precision.
    const int cluster_target = static_cast<int>(mapping[2*itarget] - 0.5f);
    const int idx_in_cluster_target = static_cast<int>(mapping[2*itarget+1] - 0.5f);
    const int cluster_size = static_cast<int>(n_class_in_cluster[cluster_target] + 0.5f);

    float* score;
    float logsum_k;
    float* target_score;
    int N;

    if (blockIdx.y == 0) {
        score = cluster_score + blockIdx.x * cluster_score_stride0;
        logsum_k = cluster_logsum[blockIdx.x];
        N = n_clusters;
        target_score = score + cluster_target;
    } else {
        score = class_score + blockIdx.x * class_score_stride0;
        logsum_k = class_logsum[blockIdx.x];
        N = cluster_size;
        target_score = score + idx_in_cluster_target;
    }

    // Parallelized score updates
    for (int i = tidx; i < N; i += nthreads) {
        score[i] = expf(score[i] - logsum_k);    // Apply exponentiation and normalization.
    }
    __syncthreads();

    // Single thread adjustment for the target score
    if (tidx == 0) {
        atomicAdd(target_score, -1.0f);          // Atomic operation to avoid race conditions.
    }
}