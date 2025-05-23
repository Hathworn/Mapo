#include "hip/hip_runtime.h"
#include "includes.h"

long kMod = 1000000007;

__global__ void helperKernel(char *S, int *dp, int n, long kMod, int len) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for(int i = index; i < n - len; i += stride) {
        int j = i + len;
        if(S[i] == S[j]) {
            dp[i * n + j] = dp[(i + 1) * n + (j - 1)] * 2;
            int left = i + 1;
            int right = j - 1;

            // Find first match from left
            while(left <= right && S[left] != S[i]) left++;
            // Find first match from right
            while(left <= right && S[right] != S[i]) right--;

            if(left == right) {
                dp[i * n + j] += 1;
            } else if(left > right) {
                dp[i * n + j] += 2;
            } else {
                dp[i * n + j] -= dp[(left + 1) * n + (right - 1)];
            }
        } else {
            dp[i * n + j] = dp[i * n + (j - 1)] + dp[(i + 1) * n + j] - dp[(i + 1) * n + (j - 1)];
        }

        dp[i * n + j] = (dp[i * n + j] + kMod) % kMod;
    }
}