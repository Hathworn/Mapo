; ModuleID = '../data/hip_kernels/11890/3/main.cu'
source_filename = "../data/hip_kernels/11890/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20needle_cuda_shared_2PiS_iiiiE4temp = internal unnamed_addr addrspace(3) global [17 x [17 x i32]] undef, align 16
@_ZZ20needle_cuda_shared_2PiS_iiiiE3ref = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20needle_cuda_shared_2PiS_iiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = sub i32 %7, %4
  %10 = add i32 %9, %5
  %11 = xor i32 %7, -1
  %12 = add i32 %11, %5
  %13 = shl nsw i32 %2, 4
  %14 = mul nsw i32 %13, %12
  %15 = shl nsw i32 %10, 4
  %16 = add nsw i32 %14, %15
  %17 = add nsw i32 %16, %8
  %18 = add i32 %17, 1
  %19 = add i32 %18, %2
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !5, !amdgpu.noclobber !9
  %23 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 0, i32 %8
  store i32 %22, i32 addrspace(3)* %23, align 4, !tbaa !5
  %24 = add nsw i32 %19, %2
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !5, !amdgpu.noclobber !9
  %28 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 1, i32 %8
  store i32 %27, i32 addrspace(3)* %28, align 4, !tbaa !5
  %29 = shl nsw i32 %2, 1
  %30 = add nsw i32 %29, %19
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !5, !amdgpu.noclobber !9
  %34 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 2, i32 %8
  store i32 %33, i32 addrspace(3)* %34, align 4, !tbaa !5
  %35 = mul nsw i32 %2, 3
  %36 = add nsw i32 %35, %19
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %37
  %39 = load i32, i32 addrspace(1)* %38, align 4, !tbaa !5, !amdgpu.noclobber !9
  %40 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 3, i32 %8
  store i32 %39, i32 addrspace(3)* %40, align 4, !tbaa !5
  %41 = shl nsw i32 %2, 2
  %42 = add nsw i32 %41, %19
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %43
  %45 = load i32, i32 addrspace(1)* %44, align 4, !tbaa !5, !amdgpu.noclobber !9
  %46 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 4, i32 %8
  store i32 %45, i32 addrspace(3)* %46, align 4, !tbaa !5
  %47 = mul nsw i32 %2, 5
  %48 = add nsw i32 %47, %19
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %49
  %51 = load i32, i32 addrspace(1)* %50, align 4, !tbaa !5, !amdgpu.noclobber !9
  %52 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 5, i32 %8
  store i32 %51, i32 addrspace(3)* %52, align 4, !tbaa !5
  %53 = mul nsw i32 %2, 6
  %54 = add nsw i32 %53, %19
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !5, !amdgpu.noclobber !9
  %58 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 6, i32 %8
  store i32 %57, i32 addrspace(3)* %58, align 4, !tbaa !5
  %59 = mul nsw i32 %2, 7
  %60 = add nsw i32 %59, %19
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %61
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !5, !amdgpu.noclobber !9
  %64 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 7, i32 %8
  store i32 %63, i32 addrspace(3)* %64, align 4, !tbaa !5
  %65 = shl nsw i32 %2, 3
  %66 = add nsw i32 %65, %19
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !5, !amdgpu.noclobber !9
  %70 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 8, i32 %8
  store i32 %69, i32 addrspace(3)* %70, align 4, !tbaa !5
  %71 = mul nsw i32 %2, 9
  %72 = add nsw i32 %71, %19
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %73
  %75 = load i32, i32 addrspace(1)* %74, align 4, !tbaa !5, !amdgpu.noclobber !9
  %76 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 9, i32 %8
  store i32 %75, i32 addrspace(3)* %76, align 4, !tbaa !5
  %77 = mul nsw i32 %2, 10
  %78 = add nsw i32 %77, %19
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !5, !amdgpu.noclobber !9
  %82 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 10, i32 %8
  store i32 %81, i32 addrspace(3)* %82, align 4, !tbaa !5
  %83 = mul nsw i32 %2, 11
  %84 = add nsw i32 %83, %19
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !5, !amdgpu.noclobber !9
  %88 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 11, i32 %8
  store i32 %87, i32 addrspace(3)* %88, align 4, !tbaa !5
  %89 = mul nsw i32 %2, 12
  %90 = add nsw i32 %89, %19
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 12, i32 %8
  store i32 %93, i32 addrspace(3)* %94, align 4, !tbaa !5
  %95 = mul nsw i32 %2, 13
  %96 = add nsw i32 %95, %19
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %97
  %99 = load i32, i32 addrspace(1)* %98, align 4, !tbaa !5, !amdgpu.noclobber !9
  %100 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 13, i32 %8
  store i32 %99, i32 addrspace(3)* %100, align 4, !tbaa !5
  %101 = mul nsw i32 %2, 14
  %102 = add nsw i32 %101, %19
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %103
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !5, !amdgpu.noclobber !9
  %106 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 14, i32 %8
  store i32 %105, i32 addrspace(3)* %106, align 4, !tbaa !5
  %107 = mul nsw i32 %2, 15
  %108 = add nsw i32 %107, %19
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %109
  %111 = load i32, i32 addrspace(1)* %110, align 4, !tbaa !5, !amdgpu.noclobber !9
  %112 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 15, i32 %8
  store i32 %111, i32 addrspace(3)* %112, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %113 = icmp eq i32 %8, 0
  br i1 %113, label %114, label %118

114:                                              ; preds = %6
  %115 = sext i32 %16 to i64
  %116 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %115
  %117 = load i32, i32 addrspace(1)* %116, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %117, i32 addrspace(3)* getelementptr inbounds ([17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 0, i32 0), align 16, !tbaa !5
  br label %118

118:                                              ; preds = %114, %6
  %119 = mul nsw i32 %8, %2
  %120 = add i32 %119, %2
  %121 = add i32 %120, %16
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !5, !amdgpu.noclobber !9
  %125 = add nuw nsw i32 %8, 1
  %126 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %125, i32 0
  store i32 %124, i32 addrspace(3)* %126, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %127 = sext i32 %18 to i64
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %127
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !5, !amdgpu.noclobber !9
  %130 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 0, i32 %125
  store i32 %129, i32 addrspace(3)* %130, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %131 = icmp eq i32 %8, 0
  br i1 %131, label %132, label %148

132:                                              ; preds = %118
  %133 = sub nuw nsw i32 1, %8
  %134 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 0, i32 %8
  %135 = load i32, i32 addrspace(3)* %134, align 4, !tbaa !5
  %136 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 0, i32 %8
  %137 = load i32, i32 addrspace(3)* %136, align 4, !tbaa !5
  %138 = add nsw i32 %137, %135
  %139 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %133, i32 %8
  %140 = load i32, i32 addrspace(3)* %139, align 4, !tbaa !5
  %141 = sub nsw i32 %140, %3
  %142 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 0, i32 %125
  %143 = load i32, i32 addrspace(3)* %142, align 4, !tbaa !5
  %144 = sub nsw i32 %143, %3
  %145 = tail call i32 @llvm.smax.i32(i32 %138, i32 %141)
  %146 = tail call i32 @llvm.smax.i32(i32 %145, i32 %144)
  %147 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %133, i32 %125
  store i32 %146, i32 addrspace(3)* %147, align 4, !tbaa !5
  br label %148

148:                                              ; preds = %132, %118
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %149 = icmp ugt i32 %8, 1
  br i1 %149, label %167, label %150

150:                                              ; preds = %148
  %151 = sub nuw nsw i32 1, %8
  %152 = sub nuw nsw i32 2, %8
  %153 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %151, i32 %8
  %154 = load i32, i32 addrspace(3)* %153, align 4, !tbaa !5
  %155 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %151, i32 %8
  %156 = load i32, i32 addrspace(3)* %155, align 4, !tbaa !5
  %157 = add nsw i32 %156, %154
  %158 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %152, i32 %8
  %159 = load i32, i32 addrspace(3)* %158, align 4, !tbaa !5
  %160 = sub nsw i32 %159, %3
  %161 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %151, i32 %125
  %162 = load i32, i32 addrspace(3)* %161, align 4, !tbaa !5
  %163 = sub nsw i32 %162, %3
  %164 = tail call i32 @llvm.smax.i32(i32 %157, i32 %160)
  %165 = tail call i32 @llvm.smax.i32(i32 %164, i32 %163)
  %166 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %152, i32 %125
  store i32 %165, i32 addrspace(3)* %166, align 4, !tbaa !5
  br label %167

167:                                              ; preds = %150, %148
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %168 = icmp ugt i32 %8, 2
  br i1 %168, label %186, label %169

169:                                              ; preds = %167
  %170 = sub nuw nsw i32 2, %8
  %171 = sub nuw nsw i32 3, %8
  %172 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %170, i32 %8
  %173 = load i32, i32 addrspace(3)* %172, align 4, !tbaa !5
  %174 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %170, i32 %8
  %175 = load i32, i32 addrspace(3)* %174, align 4, !tbaa !5
  %176 = add nsw i32 %175, %173
  %177 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %171, i32 %8
  %178 = load i32, i32 addrspace(3)* %177, align 4, !tbaa !5
  %179 = sub nsw i32 %178, %3
  %180 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %170, i32 %125
  %181 = load i32, i32 addrspace(3)* %180, align 4, !tbaa !5
  %182 = sub nsw i32 %181, %3
  %183 = tail call i32 @llvm.smax.i32(i32 %176, i32 %179)
  %184 = tail call i32 @llvm.smax.i32(i32 %183, i32 %182)
  %185 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %171, i32 %125
  store i32 %184, i32 addrspace(3)* %185, align 4, !tbaa !5
  br label %186

186:                                              ; preds = %169, %167
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %187 = icmp ugt i32 %8, 3
  br i1 %187, label %205, label %188

188:                                              ; preds = %186
  %189 = sub nuw nsw i32 3, %8
  %190 = sub nuw nsw i32 4, %8
  %191 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %189, i32 %8
  %192 = load i32, i32 addrspace(3)* %191, align 4, !tbaa !5
  %193 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %189, i32 %8
  %194 = load i32, i32 addrspace(3)* %193, align 4, !tbaa !5
  %195 = add nsw i32 %194, %192
  %196 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %190, i32 %8
  %197 = load i32, i32 addrspace(3)* %196, align 4, !tbaa !5
  %198 = sub nsw i32 %197, %3
  %199 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %189, i32 %125
  %200 = load i32, i32 addrspace(3)* %199, align 4, !tbaa !5
  %201 = sub nsw i32 %200, %3
  %202 = tail call i32 @llvm.smax.i32(i32 %195, i32 %198)
  %203 = tail call i32 @llvm.smax.i32(i32 %202, i32 %201)
  %204 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %190, i32 %125
  store i32 %203, i32 addrspace(3)* %204, align 4, !tbaa !5
  br label %205

205:                                              ; preds = %188, %186
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %206 = icmp ugt i32 %8, 4
  br i1 %206, label %224, label %207

207:                                              ; preds = %205
  %208 = sub nuw nsw i32 4, %8
  %209 = sub nuw nsw i32 5, %8
  %210 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %208, i32 %8
  %211 = load i32, i32 addrspace(3)* %210, align 4, !tbaa !5
  %212 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %208, i32 %8
  %213 = load i32, i32 addrspace(3)* %212, align 4, !tbaa !5
  %214 = add nsw i32 %213, %211
  %215 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %209, i32 %8
  %216 = load i32, i32 addrspace(3)* %215, align 4, !tbaa !5
  %217 = sub nsw i32 %216, %3
  %218 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %208, i32 %125
  %219 = load i32, i32 addrspace(3)* %218, align 4, !tbaa !5
  %220 = sub nsw i32 %219, %3
  %221 = tail call i32 @llvm.smax.i32(i32 %214, i32 %217)
  %222 = tail call i32 @llvm.smax.i32(i32 %221, i32 %220)
  %223 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %209, i32 %125
  store i32 %222, i32 addrspace(3)* %223, align 4, !tbaa !5
  br label %224

224:                                              ; preds = %207, %205
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %225 = icmp ugt i32 %8, 5
  br i1 %225, label %243, label %226

226:                                              ; preds = %224
  %227 = sub nuw nsw i32 5, %8
  %228 = sub nuw nsw i32 6, %8
  %229 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %227, i32 %8
  %230 = load i32, i32 addrspace(3)* %229, align 4, !tbaa !5
  %231 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %227, i32 %8
  %232 = load i32, i32 addrspace(3)* %231, align 4, !tbaa !5
  %233 = add nsw i32 %232, %230
  %234 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %228, i32 %8
  %235 = load i32, i32 addrspace(3)* %234, align 4, !tbaa !5
  %236 = sub nsw i32 %235, %3
  %237 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %227, i32 %125
  %238 = load i32, i32 addrspace(3)* %237, align 4, !tbaa !5
  %239 = sub nsw i32 %238, %3
  %240 = tail call i32 @llvm.smax.i32(i32 %233, i32 %236)
  %241 = tail call i32 @llvm.smax.i32(i32 %240, i32 %239)
  %242 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %228, i32 %125
  store i32 %241, i32 addrspace(3)* %242, align 4, !tbaa !5
  br label %243

243:                                              ; preds = %226, %224
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %244 = icmp ugt i32 %8, 6
  br i1 %244, label %262, label %245

245:                                              ; preds = %243
  %246 = sub nuw nsw i32 6, %8
  %247 = sub nuw nsw i32 7, %8
  %248 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %246, i32 %8
  %249 = load i32, i32 addrspace(3)* %248, align 4, !tbaa !5
  %250 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %246, i32 %8
  %251 = load i32, i32 addrspace(3)* %250, align 4, !tbaa !5
  %252 = add nsw i32 %251, %249
  %253 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %247, i32 %8
  %254 = load i32, i32 addrspace(3)* %253, align 4, !tbaa !5
  %255 = sub nsw i32 %254, %3
  %256 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %246, i32 %125
  %257 = load i32, i32 addrspace(3)* %256, align 4, !tbaa !5
  %258 = sub nsw i32 %257, %3
  %259 = tail call i32 @llvm.smax.i32(i32 %252, i32 %255)
  %260 = tail call i32 @llvm.smax.i32(i32 %259, i32 %258)
  %261 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %247, i32 %125
  store i32 %260, i32 addrspace(3)* %261, align 4, !tbaa !5
  br label %262

262:                                              ; preds = %245, %243
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %263 = icmp ugt i32 %8, 7
  br i1 %263, label %281, label %264

264:                                              ; preds = %262
  %265 = sub nuw nsw i32 7, %8
  %266 = sub nuw nsw i32 8, %8
  %267 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %265, i32 %8
  %268 = load i32, i32 addrspace(3)* %267, align 4, !tbaa !5
  %269 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %265, i32 %8
  %270 = load i32, i32 addrspace(3)* %269, align 4, !tbaa !5
  %271 = add nsw i32 %270, %268
  %272 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %266, i32 %8
  %273 = load i32, i32 addrspace(3)* %272, align 4, !tbaa !5
  %274 = sub nsw i32 %273, %3
  %275 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %265, i32 %125
  %276 = load i32, i32 addrspace(3)* %275, align 4, !tbaa !5
  %277 = sub nsw i32 %276, %3
  %278 = tail call i32 @llvm.smax.i32(i32 %271, i32 %274)
  %279 = tail call i32 @llvm.smax.i32(i32 %278, i32 %277)
  %280 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %266, i32 %125
  store i32 %279, i32 addrspace(3)* %280, align 4, !tbaa !5
  br label %281

281:                                              ; preds = %264, %262
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %282 = icmp ugt i32 %8, 8
  br i1 %282, label %300, label %283

283:                                              ; preds = %281
  %284 = sub nuw nsw i32 8, %8
  %285 = sub nuw nsw i32 9, %8
  %286 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %284, i32 %8
  %287 = load i32, i32 addrspace(3)* %286, align 4, !tbaa !5
  %288 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %284, i32 %8
  %289 = load i32, i32 addrspace(3)* %288, align 4, !tbaa !5
  %290 = add nsw i32 %289, %287
  %291 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %285, i32 %8
  %292 = load i32, i32 addrspace(3)* %291, align 4, !tbaa !5
  %293 = sub nsw i32 %292, %3
  %294 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %284, i32 %125
  %295 = load i32, i32 addrspace(3)* %294, align 4, !tbaa !5
  %296 = sub nsw i32 %295, %3
  %297 = tail call i32 @llvm.smax.i32(i32 %290, i32 %293)
  %298 = tail call i32 @llvm.smax.i32(i32 %297, i32 %296)
  %299 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %285, i32 %125
  store i32 %298, i32 addrspace(3)* %299, align 4, !tbaa !5
  br label %300

300:                                              ; preds = %283, %281
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %301 = icmp ugt i32 %8, 9
  br i1 %301, label %319, label %302

302:                                              ; preds = %300
  %303 = sub nuw nsw i32 9, %8
  %304 = sub nuw nsw i32 10, %8
  %305 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %303, i32 %8
  %306 = load i32, i32 addrspace(3)* %305, align 4, !tbaa !5
  %307 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %303, i32 %8
  %308 = load i32, i32 addrspace(3)* %307, align 4, !tbaa !5
  %309 = add nsw i32 %308, %306
  %310 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %304, i32 %8
  %311 = load i32, i32 addrspace(3)* %310, align 4, !tbaa !5
  %312 = sub nsw i32 %311, %3
  %313 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %303, i32 %125
  %314 = load i32, i32 addrspace(3)* %313, align 4, !tbaa !5
  %315 = sub nsw i32 %314, %3
  %316 = tail call i32 @llvm.smax.i32(i32 %309, i32 %312)
  %317 = tail call i32 @llvm.smax.i32(i32 %316, i32 %315)
  %318 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %304, i32 %125
  store i32 %317, i32 addrspace(3)* %318, align 4, !tbaa !5
  br label %319

319:                                              ; preds = %302, %300
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %320 = icmp ugt i32 %8, 10
  br i1 %320, label %338, label %321

321:                                              ; preds = %319
  %322 = sub nuw nsw i32 10, %8
  %323 = sub nuw nsw i32 11, %8
  %324 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %322, i32 %8
  %325 = load i32, i32 addrspace(3)* %324, align 4, !tbaa !5
  %326 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %322, i32 %8
  %327 = load i32, i32 addrspace(3)* %326, align 4, !tbaa !5
  %328 = add nsw i32 %327, %325
  %329 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %323, i32 %8
  %330 = load i32, i32 addrspace(3)* %329, align 4, !tbaa !5
  %331 = sub nsw i32 %330, %3
  %332 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %322, i32 %125
  %333 = load i32, i32 addrspace(3)* %332, align 4, !tbaa !5
  %334 = sub nsw i32 %333, %3
  %335 = tail call i32 @llvm.smax.i32(i32 %328, i32 %331)
  %336 = tail call i32 @llvm.smax.i32(i32 %335, i32 %334)
  %337 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %323, i32 %125
  store i32 %336, i32 addrspace(3)* %337, align 4, !tbaa !5
  br label %338

338:                                              ; preds = %321, %319
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %339 = icmp ugt i32 %8, 11
  br i1 %339, label %357, label %340

340:                                              ; preds = %338
  %341 = sub nuw nsw i32 11, %8
  %342 = sub nuw nsw i32 12, %8
  %343 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %341, i32 %8
  %344 = load i32, i32 addrspace(3)* %343, align 4, !tbaa !5
  %345 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %341, i32 %8
  %346 = load i32, i32 addrspace(3)* %345, align 4, !tbaa !5
  %347 = add nsw i32 %346, %344
  %348 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %342, i32 %8
  %349 = load i32, i32 addrspace(3)* %348, align 4, !tbaa !5
  %350 = sub nsw i32 %349, %3
  %351 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %341, i32 %125
  %352 = load i32, i32 addrspace(3)* %351, align 4, !tbaa !5
  %353 = sub nsw i32 %352, %3
  %354 = tail call i32 @llvm.smax.i32(i32 %347, i32 %350)
  %355 = tail call i32 @llvm.smax.i32(i32 %354, i32 %353)
  %356 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %342, i32 %125
  store i32 %355, i32 addrspace(3)* %356, align 4, !tbaa !5
  br label %357

357:                                              ; preds = %340, %338
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %358 = icmp ugt i32 %8, 12
  br i1 %358, label %376, label %359

359:                                              ; preds = %357
  %360 = sub nuw nsw i32 12, %8
  %361 = sub nuw nsw i32 13, %8
  %362 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %360, i32 %8
  %363 = load i32, i32 addrspace(3)* %362, align 4, !tbaa !5
  %364 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %360, i32 %8
  %365 = load i32, i32 addrspace(3)* %364, align 4, !tbaa !5
  %366 = add nsw i32 %365, %363
  %367 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %361, i32 %8
  %368 = load i32, i32 addrspace(3)* %367, align 4, !tbaa !5
  %369 = sub nsw i32 %368, %3
  %370 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %360, i32 %125
  %371 = load i32, i32 addrspace(3)* %370, align 4, !tbaa !5
  %372 = sub nsw i32 %371, %3
  %373 = tail call i32 @llvm.smax.i32(i32 %366, i32 %369)
  %374 = tail call i32 @llvm.smax.i32(i32 %373, i32 %372)
  %375 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %361, i32 %125
  store i32 %374, i32 addrspace(3)* %375, align 4, !tbaa !5
  br label %376

376:                                              ; preds = %359, %357
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %377 = icmp ugt i32 %8, 13
  br i1 %377, label %395, label %378

378:                                              ; preds = %376
  %379 = sub nuw nsw i32 13, %8
  %380 = sub nuw nsw i32 14, %8
  %381 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %379, i32 %8
  %382 = load i32, i32 addrspace(3)* %381, align 4, !tbaa !5
  %383 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %379, i32 %8
  %384 = load i32, i32 addrspace(3)* %383, align 4, !tbaa !5
  %385 = add nsw i32 %384, %382
  %386 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %380, i32 %8
  %387 = load i32, i32 addrspace(3)* %386, align 4, !tbaa !5
  %388 = sub nsw i32 %387, %3
  %389 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %379, i32 %125
  %390 = load i32, i32 addrspace(3)* %389, align 4, !tbaa !5
  %391 = sub nsw i32 %390, %3
  %392 = tail call i32 @llvm.smax.i32(i32 %385, i32 %388)
  %393 = tail call i32 @llvm.smax.i32(i32 %392, i32 %391)
  %394 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %380, i32 %125
  store i32 %393, i32 addrspace(3)* %394, align 4, !tbaa !5
  br label %395

395:                                              ; preds = %378, %376
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %396 = icmp ugt i32 %8, 14
  br i1 %396, label %414, label %397

397:                                              ; preds = %395
  %398 = sub nuw nsw i32 14, %8
  %399 = sub nuw nsw i32 15, %8
  %400 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %398, i32 %8
  %401 = load i32, i32 addrspace(3)* %400, align 4, !tbaa !5
  %402 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %398, i32 %8
  %403 = load i32, i32 addrspace(3)* %402, align 4, !tbaa !5
  %404 = add nsw i32 %403, %401
  %405 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %399, i32 %8
  %406 = load i32, i32 addrspace(3)* %405, align 4, !tbaa !5
  %407 = sub nsw i32 %406, %3
  %408 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %398, i32 %125
  %409 = load i32, i32 addrspace(3)* %408, align 4, !tbaa !5
  %410 = sub nsw i32 %409, %3
  %411 = tail call i32 @llvm.smax.i32(i32 %404, i32 %407)
  %412 = tail call i32 @llvm.smax.i32(i32 %411, i32 %410)
  %413 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %399, i32 %125
  store i32 %412, i32 addrspace(3)* %413, align 4, !tbaa !5
  br label %414

414:                                              ; preds = %397, %395
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %415 = icmp ugt i32 %8, 15
  %416 = sub nsw i32 15, %8
  br i1 %415, label %433, label %417

417:                                              ; preds = %414
  %418 = sub nuw nsw i32 16, %8
  %419 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %8
  %420 = load i32, i32 addrspace(3)* %419, align 4, !tbaa !5
  %421 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %8
  %422 = load i32, i32 addrspace(3)* %421, align 4, !tbaa !5
  %423 = add nsw i32 %422, %420
  %424 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %418, i32 %8
  %425 = load i32, i32 addrspace(3)* %424, align 4, !tbaa !5
  %426 = sub nsw i32 %425, %3
  %427 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %125
  %428 = load i32, i32 addrspace(3)* %427, align 4, !tbaa !5
  %429 = sub nsw i32 %428, %3
  %430 = tail call i32 @llvm.smax.i32(i32 %423, i32 %426)
  %431 = tail call i32 @llvm.smax.i32(i32 %430, i32 %429)
  %432 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %418, i32 %125
  store i32 %431, i32 addrspace(3)* %432, align 4, !tbaa !5
  br label %433

433:                                              ; preds = %414, %417
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %434 = add nuw nsw i32 %8, 16
  %435 = sub nsw i32 16, %8
  br i1 %396, label %453, label %436

436:                                              ; preds = %433
  %437 = add nuw nsw i32 %8, 2
  %438 = add nuw nsw i32 %8, 1
  %439 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %438
  %440 = load i32, i32 addrspace(3)* %439, align 4, !tbaa !5
  %441 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %438
  %442 = load i32, i32 addrspace(3)* %441, align 4, !tbaa !5
  %443 = add nsw i32 %442, %440
  %444 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %438
  %445 = load i32, i32 addrspace(3)* %444, align 4, !tbaa !5
  %446 = sub nsw i32 %445, %3
  %447 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %437
  %448 = load i32, i32 addrspace(3)* %447, align 4, !tbaa !5
  %449 = sub nsw i32 %448, %3
  %450 = tail call i32 @llvm.smax.i32(i32 %443, i32 %446)
  %451 = tail call i32 @llvm.smax.i32(i32 %450, i32 %449)
  %452 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %437
  store i32 %451, i32 addrspace(3)* %452, align 4, !tbaa !5
  br label %453

453:                                              ; preds = %436, %433
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %377, label %471, label %454

454:                                              ; preds = %453
  %455 = add nuw nsw i32 %8, 3
  %456 = add nuw nsw i32 %8, 2
  %457 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %456
  %458 = load i32, i32 addrspace(3)* %457, align 4, !tbaa !5
  %459 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %456
  %460 = load i32, i32 addrspace(3)* %459, align 4, !tbaa !5
  %461 = add nsw i32 %460, %458
  %462 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %456
  %463 = load i32, i32 addrspace(3)* %462, align 4, !tbaa !5
  %464 = sub nsw i32 %463, %3
  %465 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %455
  %466 = load i32, i32 addrspace(3)* %465, align 4, !tbaa !5
  %467 = sub nsw i32 %466, %3
  %468 = tail call i32 @llvm.smax.i32(i32 %461, i32 %464)
  %469 = tail call i32 @llvm.smax.i32(i32 %468, i32 %467)
  %470 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %455
  store i32 %469, i32 addrspace(3)* %470, align 4, !tbaa !5
  br label %471

471:                                              ; preds = %454, %453
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %358, label %489, label %472

472:                                              ; preds = %471
  %473 = add nuw nsw i32 %8, 4
  %474 = add nuw nsw i32 %8, 3
  %475 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %474
  %476 = load i32, i32 addrspace(3)* %475, align 4, !tbaa !5
  %477 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %474
  %478 = load i32, i32 addrspace(3)* %477, align 4, !tbaa !5
  %479 = add nsw i32 %478, %476
  %480 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %474
  %481 = load i32, i32 addrspace(3)* %480, align 4, !tbaa !5
  %482 = sub nsw i32 %481, %3
  %483 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %473
  %484 = load i32, i32 addrspace(3)* %483, align 4, !tbaa !5
  %485 = sub nsw i32 %484, %3
  %486 = tail call i32 @llvm.smax.i32(i32 %479, i32 %482)
  %487 = tail call i32 @llvm.smax.i32(i32 %486, i32 %485)
  %488 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %473
  store i32 %487, i32 addrspace(3)* %488, align 4, !tbaa !5
  br label %489

489:                                              ; preds = %472, %471
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %339, label %507, label %490

490:                                              ; preds = %489
  %491 = add nuw nsw i32 %8, 5
  %492 = add nuw nsw i32 %8, 4
  %493 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %492
  %494 = load i32, i32 addrspace(3)* %493, align 4, !tbaa !5
  %495 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %492
  %496 = load i32, i32 addrspace(3)* %495, align 4, !tbaa !5
  %497 = add nsw i32 %496, %494
  %498 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %492
  %499 = load i32, i32 addrspace(3)* %498, align 4, !tbaa !5
  %500 = sub nsw i32 %499, %3
  %501 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %491
  %502 = load i32, i32 addrspace(3)* %501, align 4, !tbaa !5
  %503 = sub nsw i32 %502, %3
  %504 = tail call i32 @llvm.smax.i32(i32 %497, i32 %500)
  %505 = tail call i32 @llvm.smax.i32(i32 %504, i32 %503)
  %506 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %491
  store i32 %505, i32 addrspace(3)* %506, align 4, !tbaa !5
  br label %507

507:                                              ; preds = %490, %489
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %320, label %525, label %508

508:                                              ; preds = %507
  %509 = add nuw nsw i32 %8, 6
  %510 = add nuw nsw i32 %8, 5
  %511 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %510
  %512 = load i32, i32 addrspace(3)* %511, align 4, !tbaa !5
  %513 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %510
  %514 = load i32, i32 addrspace(3)* %513, align 4, !tbaa !5
  %515 = add nsw i32 %514, %512
  %516 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %510
  %517 = load i32, i32 addrspace(3)* %516, align 4, !tbaa !5
  %518 = sub nsw i32 %517, %3
  %519 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %509
  %520 = load i32, i32 addrspace(3)* %519, align 4, !tbaa !5
  %521 = sub nsw i32 %520, %3
  %522 = tail call i32 @llvm.smax.i32(i32 %515, i32 %518)
  %523 = tail call i32 @llvm.smax.i32(i32 %522, i32 %521)
  %524 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %509
  store i32 %523, i32 addrspace(3)* %524, align 4, !tbaa !5
  br label %525

525:                                              ; preds = %508, %507
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %301, label %543, label %526

526:                                              ; preds = %525
  %527 = add nuw nsw i32 %8, 7
  %528 = add nuw nsw i32 %8, 6
  %529 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %528
  %530 = load i32, i32 addrspace(3)* %529, align 4, !tbaa !5
  %531 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %528
  %532 = load i32, i32 addrspace(3)* %531, align 4, !tbaa !5
  %533 = add nsw i32 %532, %530
  %534 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %528
  %535 = load i32, i32 addrspace(3)* %534, align 4, !tbaa !5
  %536 = sub nsw i32 %535, %3
  %537 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %527
  %538 = load i32, i32 addrspace(3)* %537, align 4, !tbaa !5
  %539 = sub nsw i32 %538, %3
  %540 = tail call i32 @llvm.smax.i32(i32 %533, i32 %536)
  %541 = tail call i32 @llvm.smax.i32(i32 %540, i32 %539)
  %542 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %527
  store i32 %541, i32 addrspace(3)* %542, align 4, !tbaa !5
  br label %543

543:                                              ; preds = %526, %525
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %282, label %561, label %544

544:                                              ; preds = %543
  %545 = add nuw nsw i32 %8, 8
  %546 = add nuw nsw i32 %8, 7
  %547 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %546
  %548 = load i32, i32 addrspace(3)* %547, align 4, !tbaa !5
  %549 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %546
  %550 = load i32, i32 addrspace(3)* %549, align 4, !tbaa !5
  %551 = add nsw i32 %550, %548
  %552 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %546
  %553 = load i32, i32 addrspace(3)* %552, align 4, !tbaa !5
  %554 = sub nsw i32 %553, %3
  %555 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %545
  %556 = load i32, i32 addrspace(3)* %555, align 4, !tbaa !5
  %557 = sub nsw i32 %556, %3
  %558 = tail call i32 @llvm.smax.i32(i32 %551, i32 %554)
  %559 = tail call i32 @llvm.smax.i32(i32 %558, i32 %557)
  %560 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %545
  store i32 %559, i32 addrspace(3)* %560, align 4, !tbaa !5
  br label %561

561:                                              ; preds = %544, %543
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %263, label %579, label %562

562:                                              ; preds = %561
  %563 = add nuw nsw i32 %8, 9
  %564 = add nuw nsw i32 %8, 8
  %565 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %564
  %566 = load i32, i32 addrspace(3)* %565, align 4, !tbaa !5
  %567 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %564
  %568 = load i32, i32 addrspace(3)* %567, align 4, !tbaa !5
  %569 = add nsw i32 %568, %566
  %570 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %564
  %571 = load i32, i32 addrspace(3)* %570, align 4, !tbaa !5
  %572 = sub nsw i32 %571, %3
  %573 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %563
  %574 = load i32, i32 addrspace(3)* %573, align 4, !tbaa !5
  %575 = sub nsw i32 %574, %3
  %576 = tail call i32 @llvm.smax.i32(i32 %569, i32 %572)
  %577 = tail call i32 @llvm.smax.i32(i32 %576, i32 %575)
  %578 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %563
  store i32 %577, i32 addrspace(3)* %578, align 4, !tbaa !5
  br label %579

579:                                              ; preds = %562, %561
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %244, label %597, label %580

580:                                              ; preds = %579
  %581 = add nuw nsw i32 %8, 10
  %582 = add nuw nsw i32 %8, 9
  %583 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %582
  %584 = load i32, i32 addrspace(3)* %583, align 4, !tbaa !5
  %585 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %582
  %586 = load i32, i32 addrspace(3)* %585, align 4, !tbaa !5
  %587 = add nsw i32 %586, %584
  %588 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %582
  %589 = load i32, i32 addrspace(3)* %588, align 4, !tbaa !5
  %590 = sub nsw i32 %589, %3
  %591 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %581
  %592 = load i32, i32 addrspace(3)* %591, align 4, !tbaa !5
  %593 = sub nsw i32 %592, %3
  %594 = tail call i32 @llvm.smax.i32(i32 %587, i32 %590)
  %595 = tail call i32 @llvm.smax.i32(i32 %594, i32 %593)
  %596 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %581
  store i32 %595, i32 addrspace(3)* %596, align 4, !tbaa !5
  br label %597

597:                                              ; preds = %580, %579
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %225, label %615, label %598

598:                                              ; preds = %597
  %599 = add nuw nsw i32 %8, 11
  %600 = add nuw nsw i32 %8, 10
  %601 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %600
  %602 = load i32, i32 addrspace(3)* %601, align 4, !tbaa !5
  %603 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %600
  %604 = load i32, i32 addrspace(3)* %603, align 4, !tbaa !5
  %605 = add nsw i32 %604, %602
  %606 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %600
  %607 = load i32, i32 addrspace(3)* %606, align 4, !tbaa !5
  %608 = sub nsw i32 %607, %3
  %609 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %599
  %610 = load i32, i32 addrspace(3)* %609, align 4, !tbaa !5
  %611 = sub nsw i32 %610, %3
  %612 = tail call i32 @llvm.smax.i32(i32 %605, i32 %608)
  %613 = tail call i32 @llvm.smax.i32(i32 %612, i32 %611)
  %614 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %599
  store i32 %613, i32 addrspace(3)* %614, align 4, !tbaa !5
  br label %615

615:                                              ; preds = %598, %597
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %206, label %633, label %616

616:                                              ; preds = %615
  %617 = add nuw nsw i32 %8, 12
  %618 = add nuw nsw i32 %8, 11
  %619 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %618
  %620 = load i32, i32 addrspace(3)* %619, align 4, !tbaa !5
  %621 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %618
  %622 = load i32, i32 addrspace(3)* %621, align 4, !tbaa !5
  %623 = add nsw i32 %622, %620
  %624 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %618
  %625 = load i32, i32 addrspace(3)* %624, align 4, !tbaa !5
  %626 = sub nsw i32 %625, %3
  %627 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %617
  %628 = load i32, i32 addrspace(3)* %627, align 4, !tbaa !5
  %629 = sub nsw i32 %628, %3
  %630 = tail call i32 @llvm.smax.i32(i32 %623, i32 %626)
  %631 = tail call i32 @llvm.smax.i32(i32 %630, i32 %629)
  %632 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %617
  store i32 %631, i32 addrspace(3)* %632, align 4, !tbaa !5
  br label %633

633:                                              ; preds = %616, %615
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %187, label %651, label %634

634:                                              ; preds = %633
  %635 = add nuw nsw i32 %8, 13
  %636 = add nuw nsw i32 %8, 12
  %637 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %636
  %638 = load i32, i32 addrspace(3)* %637, align 4, !tbaa !5
  %639 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %636
  %640 = load i32, i32 addrspace(3)* %639, align 4, !tbaa !5
  %641 = add nsw i32 %640, %638
  %642 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %636
  %643 = load i32, i32 addrspace(3)* %642, align 4, !tbaa !5
  %644 = sub nsw i32 %643, %3
  %645 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %635
  %646 = load i32, i32 addrspace(3)* %645, align 4, !tbaa !5
  %647 = sub nsw i32 %646, %3
  %648 = tail call i32 @llvm.smax.i32(i32 %641, i32 %644)
  %649 = tail call i32 @llvm.smax.i32(i32 %648, i32 %647)
  %650 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %635
  store i32 %649, i32 addrspace(3)* %650, align 4, !tbaa !5
  br label %651

651:                                              ; preds = %634, %633
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %168, label %669, label %652

652:                                              ; preds = %651
  %653 = add nuw nsw i32 %8, 14
  %654 = add nuw nsw i32 %8, 13
  %655 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %654
  %656 = load i32, i32 addrspace(3)* %655, align 4, !tbaa !5
  %657 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %654
  %658 = load i32, i32 addrspace(3)* %657, align 4, !tbaa !5
  %659 = add nsw i32 %658, %656
  %660 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %654
  %661 = load i32, i32 addrspace(3)* %660, align 4, !tbaa !5
  %662 = sub nsw i32 %661, %3
  %663 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %653
  %664 = load i32, i32 addrspace(3)* %663, align 4, !tbaa !5
  %665 = sub nsw i32 %664, %3
  %666 = tail call i32 @llvm.smax.i32(i32 %659, i32 %662)
  %667 = tail call i32 @llvm.smax.i32(i32 %666, i32 %665)
  %668 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %653
  store i32 %667, i32 addrspace(3)* %668, align 4, !tbaa !5
  br label %669

669:                                              ; preds = %652, %651
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %149, label %687, label %670

670:                                              ; preds = %669
  %671 = add nuw nsw i32 %8, 15
  %672 = add nuw nsw i32 %8, 14
  %673 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %672
  %674 = load i32, i32 addrspace(3)* %673, align 4, !tbaa !5
  %675 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %672
  %676 = load i32, i32 addrspace(3)* %675, align 4, !tbaa !5
  %677 = add nsw i32 %676, %674
  %678 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %672
  %679 = load i32, i32 addrspace(3)* %678, align 4, !tbaa !5
  %680 = sub nsw i32 %679, %3
  %681 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %671
  %682 = load i32, i32 addrspace(3)* %681, align 4, !tbaa !5
  %683 = sub nsw i32 %682, %3
  %684 = tail call i32 @llvm.smax.i32(i32 %677, i32 %680)
  %685 = tail call i32 @llvm.smax.i32(i32 %684, i32 %683)
  %686 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %671
  store i32 %685, i32 addrspace(3)* %686, align 4, !tbaa !5
  br label %687

687:                                              ; preds = %670, %669
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %131, label %688, label %704

688:                                              ; preds = %687
  %689 = add nuw nsw i32 %8, 15
  %690 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %689
  %691 = load i32, i32 addrspace(3)* %690, align 4, !tbaa !5
  %692 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE3ref, i32 0, i32 %416, i32 %689
  %693 = load i32, i32 addrspace(3)* %692, align 4, !tbaa !5
  %694 = add nsw i32 %693, %691
  %695 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %689
  %696 = load i32, i32 addrspace(3)* %695, align 4, !tbaa !5
  %697 = sub nsw i32 %696, %3
  %698 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %416, i32 %434
  %699 = load i32, i32 addrspace(3)* %698, align 4, !tbaa !5
  %700 = sub nsw i32 %699, %3
  %701 = tail call i32 @llvm.smax.i32(i32 %694, i32 %697)
  %702 = tail call i32 @llvm.smax.i32(i32 %701, i32 %700)
  %703 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 %435, i32 %434
  store i32 %702, i32 addrspace(3)* %703, align 4, !tbaa !5
  br label %704

704:                                              ; preds = %688, %687
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %705 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 1, i32 %125
  %706 = load i32, i32 addrspace(3)* %705, align 4, !tbaa !5
  %707 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %20
  store i32 %706, i32 addrspace(1)* %707, align 4, !tbaa !5
  %708 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 2, i32 %125
  %709 = load i32, i32 addrspace(3)* %708, align 4, !tbaa !5
  %710 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %25
  store i32 %709, i32 addrspace(1)* %710, align 4, !tbaa !5
  %711 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 3, i32 %125
  %712 = load i32, i32 addrspace(3)* %711, align 4, !tbaa !5
  %713 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %31
  store i32 %712, i32 addrspace(1)* %713, align 4, !tbaa !5
  %714 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 4, i32 %125
  %715 = load i32, i32 addrspace(3)* %714, align 4, !tbaa !5
  %716 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %37
  store i32 %715, i32 addrspace(1)* %716, align 4, !tbaa !5
  %717 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 5, i32 %125
  %718 = load i32, i32 addrspace(3)* %717, align 4, !tbaa !5
  %719 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %43
  store i32 %718, i32 addrspace(1)* %719, align 4, !tbaa !5
  %720 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 6, i32 %125
  %721 = load i32, i32 addrspace(3)* %720, align 4, !tbaa !5
  %722 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %49
  store i32 %721, i32 addrspace(1)* %722, align 4, !tbaa !5
  %723 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 7, i32 %125
  %724 = load i32, i32 addrspace(3)* %723, align 4, !tbaa !5
  %725 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  store i32 %724, i32 addrspace(1)* %725, align 4, !tbaa !5
  %726 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 8, i32 %125
  %727 = load i32, i32 addrspace(3)* %726, align 4, !tbaa !5
  %728 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %61
  store i32 %727, i32 addrspace(1)* %728, align 4, !tbaa !5
  %729 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 9, i32 %125
  %730 = load i32, i32 addrspace(3)* %729, align 4, !tbaa !5
  %731 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  store i32 %730, i32 addrspace(1)* %731, align 4, !tbaa !5
  %732 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 10, i32 %125
  %733 = load i32, i32 addrspace(3)* %732, align 4, !tbaa !5
  %734 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %73
  store i32 %733, i32 addrspace(1)* %734, align 4, !tbaa !5
  %735 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 11, i32 %125
  %736 = load i32, i32 addrspace(3)* %735, align 4, !tbaa !5
  %737 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %79
  store i32 %736, i32 addrspace(1)* %737, align 4, !tbaa !5
  %738 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 12, i32 %125
  %739 = load i32, i32 addrspace(3)* %738, align 4, !tbaa !5
  %740 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %85
  store i32 %739, i32 addrspace(1)* %740, align 4, !tbaa !5
  %741 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 13, i32 %125
  %742 = load i32, i32 addrspace(3)* %741, align 4, !tbaa !5
  %743 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  store i32 %742, i32 addrspace(1)* %743, align 4, !tbaa !5
  %744 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 14, i32 %125
  %745 = load i32, i32 addrspace(3)* %744, align 4, !tbaa !5
  %746 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %97
  store i32 %745, i32 addrspace(1)* %746, align 4, !tbaa !5
  %747 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 15, i32 %125
  %748 = load i32, i32 addrspace(3)* %747, align 4, !tbaa !5
  %749 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %103
  store i32 %748, i32 addrspace(1)* %749, align 4, !tbaa !5
  %750 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_2PiS_iiiiE4temp, i32 0, i32 16, i32 %125
  %751 = load i32, i32 addrspace(3)* %750, align 4, !tbaa !5
  %752 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %109
  store i32 %751, i32 addrspace(1)* %752, align 4, !tbaa !5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
