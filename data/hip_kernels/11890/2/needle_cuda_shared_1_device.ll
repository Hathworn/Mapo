; ModuleID = '../data/hip_kernels/11890/2/main.cu'
source_filename = "../data/hip_kernels/11890/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ20needle_cuda_shared_1PiS_iiiiE4temp = internal unnamed_addr addrspace(3) global [17 x [17 x i32]] undef, align 16
@_ZZ20needle_cuda_shared_1PiS_iiiiE3ref = internal unnamed_addr addrspace(3) global [16 x [16 x i32]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z20needle_cuda_shared_1PiS_iiii(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture %1, i32 %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %9 = xor i32 %7, -1
  %10 = add i32 %9, %4
  %11 = shl nsw i32 %2, 4
  %12 = mul nsw i32 %11, %10
  %13 = shl nsw i32 %7, 4
  %14 = add nsw i32 %12, %13
  %15 = add nsw i32 %14, %8
  %16 = add i32 %15, 1
  %17 = add i32 %16, %2
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %18
  %20 = load i32, i32 addrspace(1)* %19, align 4, !tbaa !5, !amdgpu.noclobber !9
  %21 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 0, i32 %8
  store i32 %20, i32 addrspace(3)* %21, align 4, !tbaa !5
  %22 = add nsw i32 %17, %2
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %23
  %25 = load i32, i32 addrspace(1)* %24, align 4, !tbaa !5, !amdgpu.noclobber !9
  %26 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 1, i32 %8
  store i32 %25, i32 addrspace(3)* %26, align 4, !tbaa !5
  %27 = shl nsw i32 %2, 1
  %28 = add nsw i32 %27, %17
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !5, !amdgpu.noclobber !9
  %32 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 2, i32 %8
  store i32 %31, i32 addrspace(3)* %32, align 4, !tbaa !5
  %33 = mul nsw i32 %2, 3
  %34 = add nsw i32 %33, %17
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !5, !amdgpu.noclobber !9
  %38 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 3, i32 %8
  store i32 %37, i32 addrspace(3)* %38, align 4, !tbaa !5
  %39 = shl nsw i32 %2, 2
  %40 = add nsw i32 %39, %17
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !5, !amdgpu.noclobber !9
  %44 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 4, i32 %8
  store i32 %43, i32 addrspace(3)* %44, align 4, !tbaa !5
  %45 = mul nsw i32 %2, 5
  %46 = add nsw i32 %45, %17
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !5, !amdgpu.noclobber !9
  %50 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 5, i32 %8
  store i32 %49, i32 addrspace(3)* %50, align 4, !tbaa !5
  %51 = mul nsw i32 %2, 6
  %52 = add nsw i32 %51, %17
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !5, !amdgpu.noclobber !9
  %56 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 6, i32 %8
  store i32 %55, i32 addrspace(3)* %56, align 4, !tbaa !5
  %57 = mul nsw i32 %2, 7
  %58 = add nsw i32 %57, %17
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %59
  %61 = load i32, i32 addrspace(1)* %60, align 4, !tbaa !5, !amdgpu.noclobber !9
  %62 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 7, i32 %8
  store i32 %61, i32 addrspace(3)* %62, align 4, !tbaa !5
  %63 = shl nsw i32 %2, 3
  %64 = add nsw i32 %63, %17
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %65
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !5, !amdgpu.noclobber !9
  %68 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 8, i32 %8
  store i32 %67, i32 addrspace(3)* %68, align 4, !tbaa !5
  %69 = mul nsw i32 %2, 9
  %70 = add nsw i32 %69, %17
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %71
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !5, !amdgpu.noclobber !9
  %74 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 9, i32 %8
  store i32 %73, i32 addrspace(3)* %74, align 4, !tbaa !5
  %75 = mul nsw i32 %2, 10
  %76 = add nsw i32 %75, %17
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %77
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  %80 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 10, i32 %8
  store i32 %79, i32 addrspace(3)* %80, align 4, !tbaa !5
  %81 = mul nsw i32 %2, 11
  %82 = add nsw i32 %81, %17
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %83
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !5, !amdgpu.noclobber !9
  %86 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 11, i32 %8
  store i32 %85, i32 addrspace(3)* %86, align 4, !tbaa !5
  %87 = mul nsw i32 %2, 12
  %88 = add nsw i32 %87, %17
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %89
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !5, !amdgpu.noclobber !9
  %92 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 12, i32 %8
  store i32 %91, i32 addrspace(3)* %92, align 4, !tbaa !5
  %93 = mul nsw i32 %2, 13
  %94 = add nsw i32 %93, %17
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %95
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !5, !amdgpu.noclobber !9
  %98 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 13, i32 %8
  store i32 %97, i32 addrspace(3)* %98, align 4, !tbaa !5
  %99 = mul nsw i32 %2, 14
  %100 = add nsw i32 %99, %17
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %101
  %103 = load i32, i32 addrspace(1)* %102, align 4, !tbaa !5, !amdgpu.noclobber !9
  %104 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 14, i32 %8
  store i32 %103, i32 addrspace(3)* %104, align 4, !tbaa !5
  %105 = mul nsw i32 %2, 15
  %106 = add nsw i32 %105, %17
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %107
  %109 = load i32, i32 addrspace(1)* %108, align 4, !tbaa !5, !amdgpu.noclobber !9
  %110 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 15, i32 %8
  store i32 %109, i32 addrspace(3)* %110, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %111 = icmp eq i32 %8, 0
  br i1 %111, label %112, label %116

112:                                              ; preds = %6
  %113 = sext i32 %14 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %113
  %115 = load i32, i32 addrspace(1)* %114, align 4, !tbaa !5, !amdgpu.noclobber !9
  store i32 %115, i32 addrspace(3)* getelementptr inbounds ([17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 0, i32 0), align 16, !tbaa !5
  br label %116

116:                                              ; preds = %112, %6
  %117 = mul nsw i32 %8, %2
  %118 = add i32 %117, %2
  %119 = add i32 %118, %14
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %120
  %122 = load i32, i32 addrspace(1)* %121, align 4, !tbaa !5, !amdgpu.noclobber !9
  %123 = add nuw nsw i32 %8, 1
  %124 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %123, i32 0
  store i32 %122, i32 addrspace(3)* %124, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %125 = sext i32 %16 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %125
  %127 = load i32, i32 addrspace(1)* %126, align 4, !tbaa !5, !amdgpu.noclobber !9
  %128 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 0, i32 %123
  store i32 %127, i32 addrspace(3)* %128, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %129 = icmp eq i32 %8, 0
  br i1 %129, label %130, label %146

130:                                              ; preds = %116
  %131 = sub nuw nsw i32 1, %8
  %132 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 0, i32 %8
  %133 = load i32, i32 addrspace(3)* %132, align 4, !tbaa !5
  %134 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 0, i32 %8
  %135 = load i32, i32 addrspace(3)* %134, align 4, !tbaa !5
  %136 = add nsw i32 %135, %133
  %137 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %131, i32 %8
  %138 = load i32, i32 addrspace(3)* %137, align 4, !tbaa !5
  %139 = sub nsw i32 %138, %3
  %140 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 0, i32 %123
  %141 = load i32, i32 addrspace(3)* %140, align 4, !tbaa !5
  %142 = sub nsw i32 %141, %3
  %143 = tail call i32 @llvm.smax.i32(i32 %136, i32 %139)
  %144 = tail call i32 @llvm.smax.i32(i32 %143, i32 %142)
  %145 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %131, i32 %123
  store i32 %144, i32 addrspace(3)* %145, align 4, !tbaa !5
  br label %146

146:                                              ; preds = %130, %116
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %147 = icmp ugt i32 %8, 1
  br i1 %147, label %165, label %148

148:                                              ; preds = %146
  %149 = sub nuw nsw i32 1, %8
  %150 = sub nuw nsw i32 2, %8
  %151 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %149, i32 %8
  %152 = load i32, i32 addrspace(3)* %151, align 4, !tbaa !5
  %153 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %149, i32 %8
  %154 = load i32, i32 addrspace(3)* %153, align 4, !tbaa !5
  %155 = add nsw i32 %154, %152
  %156 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %150, i32 %8
  %157 = load i32, i32 addrspace(3)* %156, align 4, !tbaa !5
  %158 = sub nsw i32 %157, %3
  %159 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %149, i32 %123
  %160 = load i32, i32 addrspace(3)* %159, align 4, !tbaa !5
  %161 = sub nsw i32 %160, %3
  %162 = tail call i32 @llvm.smax.i32(i32 %155, i32 %158)
  %163 = tail call i32 @llvm.smax.i32(i32 %162, i32 %161)
  %164 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %150, i32 %123
  store i32 %163, i32 addrspace(3)* %164, align 4, !tbaa !5
  br label %165

165:                                              ; preds = %148, %146
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %166 = icmp ugt i32 %8, 2
  br i1 %166, label %184, label %167

167:                                              ; preds = %165
  %168 = sub nuw nsw i32 2, %8
  %169 = sub nuw nsw i32 3, %8
  %170 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %168, i32 %8
  %171 = load i32, i32 addrspace(3)* %170, align 4, !tbaa !5
  %172 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %168, i32 %8
  %173 = load i32, i32 addrspace(3)* %172, align 4, !tbaa !5
  %174 = add nsw i32 %173, %171
  %175 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %169, i32 %8
  %176 = load i32, i32 addrspace(3)* %175, align 4, !tbaa !5
  %177 = sub nsw i32 %176, %3
  %178 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %168, i32 %123
  %179 = load i32, i32 addrspace(3)* %178, align 4, !tbaa !5
  %180 = sub nsw i32 %179, %3
  %181 = tail call i32 @llvm.smax.i32(i32 %174, i32 %177)
  %182 = tail call i32 @llvm.smax.i32(i32 %181, i32 %180)
  %183 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %169, i32 %123
  store i32 %182, i32 addrspace(3)* %183, align 4, !tbaa !5
  br label %184

184:                                              ; preds = %167, %165
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %185 = icmp ugt i32 %8, 3
  br i1 %185, label %203, label %186

186:                                              ; preds = %184
  %187 = sub nuw nsw i32 3, %8
  %188 = sub nuw nsw i32 4, %8
  %189 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %187, i32 %8
  %190 = load i32, i32 addrspace(3)* %189, align 4, !tbaa !5
  %191 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %187, i32 %8
  %192 = load i32, i32 addrspace(3)* %191, align 4, !tbaa !5
  %193 = add nsw i32 %192, %190
  %194 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %188, i32 %8
  %195 = load i32, i32 addrspace(3)* %194, align 4, !tbaa !5
  %196 = sub nsw i32 %195, %3
  %197 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %187, i32 %123
  %198 = load i32, i32 addrspace(3)* %197, align 4, !tbaa !5
  %199 = sub nsw i32 %198, %3
  %200 = tail call i32 @llvm.smax.i32(i32 %193, i32 %196)
  %201 = tail call i32 @llvm.smax.i32(i32 %200, i32 %199)
  %202 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %188, i32 %123
  store i32 %201, i32 addrspace(3)* %202, align 4, !tbaa !5
  br label %203

203:                                              ; preds = %186, %184
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %204 = icmp ugt i32 %8, 4
  br i1 %204, label %222, label %205

205:                                              ; preds = %203
  %206 = sub nuw nsw i32 4, %8
  %207 = sub nuw nsw i32 5, %8
  %208 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %206, i32 %8
  %209 = load i32, i32 addrspace(3)* %208, align 4, !tbaa !5
  %210 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %206, i32 %8
  %211 = load i32, i32 addrspace(3)* %210, align 4, !tbaa !5
  %212 = add nsw i32 %211, %209
  %213 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %207, i32 %8
  %214 = load i32, i32 addrspace(3)* %213, align 4, !tbaa !5
  %215 = sub nsw i32 %214, %3
  %216 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %206, i32 %123
  %217 = load i32, i32 addrspace(3)* %216, align 4, !tbaa !5
  %218 = sub nsw i32 %217, %3
  %219 = tail call i32 @llvm.smax.i32(i32 %212, i32 %215)
  %220 = tail call i32 @llvm.smax.i32(i32 %219, i32 %218)
  %221 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %207, i32 %123
  store i32 %220, i32 addrspace(3)* %221, align 4, !tbaa !5
  br label %222

222:                                              ; preds = %205, %203
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %223 = icmp ugt i32 %8, 5
  br i1 %223, label %241, label %224

224:                                              ; preds = %222
  %225 = sub nuw nsw i32 5, %8
  %226 = sub nuw nsw i32 6, %8
  %227 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %225, i32 %8
  %228 = load i32, i32 addrspace(3)* %227, align 4, !tbaa !5
  %229 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %225, i32 %8
  %230 = load i32, i32 addrspace(3)* %229, align 4, !tbaa !5
  %231 = add nsw i32 %230, %228
  %232 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %226, i32 %8
  %233 = load i32, i32 addrspace(3)* %232, align 4, !tbaa !5
  %234 = sub nsw i32 %233, %3
  %235 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %225, i32 %123
  %236 = load i32, i32 addrspace(3)* %235, align 4, !tbaa !5
  %237 = sub nsw i32 %236, %3
  %238 = tail call i32 @llvm.smax.i32(i32 %231, i32 %234)
  %239 = tail call i32 @llvm.smax.i32(i32 %238, i32 %237)
  %240 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %226, i32 %123
  store i32 %239, i32 addrspace(3)* %240, align 4, !tbaa !5
  br label %241

241:                                              ; preds = %224, %222
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %242 = icmp ugt i32 %8, 6
  br i1 %242, label %260, label %243

243:                                              ; preds = %241
  %244 = sub nuw nsw i32 6, %8
  %245 = sub nuw nsw i32 7, %8
  %246 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %244, i32 %8
  %247 = load i32, i32 addrspace(3)* %246, align 4, !tbaa !5
  %248 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %244, i32 %8
  %249 = load i32, i32 addrspace(3)* %248, align 4, !tbaa !5
  %250 = add nsw i32 %249, %247
  %251 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %245, i32 %8
  %252 = load i32, i32 addrspace(3)* %251, align 4, !tbaa !5
  %253 = sub nsw i32 %252, %3
  %254 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %244, i32 %123
  %255 = load i32, i32 addrspace(3)* %254, align 4, !tbaa !5
  %256 = sub nsw i32 %255, %3
  %257 = tail call i32 @llvm.smax.i32(i32 %250, i32 %253)
  %258 = tail call i32 @llvm.smax.i32(i32 %257, i32 %256)
  %259 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %245, i32 %123
  store i32 %258, i32 addrspace(3)* %259, align 4, !tbaa !5
  br label %260

260:                                              ; preds = %243, %241
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %261 = icmp ugt i32 %8, 7
  br i1 %261, label %279, label %262

262:                                              ; preds = %260
  %263 = sub nuw nsw i32 7, %8
  %264 = sub nuw nsw i32 8, %8
  %265 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %263, i32 %8
  %266 = load i32, i32 addrspace(3)* %265, align 4, !tbaa !5
  %267 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %263, i32 %8
  %268 = load i32, i32 addrspace(3)* %267, align 4, !tbaa !5
  %269 = add nsw i32 %268, %266
  %270 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %264, i32 %8
  %271 = load i32, i32 addrspace(3)* %270, align 4, !tbaa !5
  %272 = sub nsw i32 %271, %3
  %273 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %263, i32 %123
  %274 = load i32, i32 addrspace(3)* %273, align 4, !tbaa !5
  %275 = sub nsw i32 %274, %3
  %276 = tail call i32 @llvm.smax.i32(i32 %269, i32 %272)
  %277 = tail call i32 @llvm.smax.i32(i32 %276, i32 %275)
  %278 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %264, i32 %123
  store i32 %277, i32 addrspace(3)* %278, align 4, !tbaa !5
  br label %279

279:                                              ; preds = %262, %260
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %280 = icmp ugt i32 %8, 8
  br i1 %280, label %298, label %281

281:                                              ; preds = %279
  %282 = sub nuw nsw i32 8, %8
  %283 = sub nuw nsw i32 9, %8
  %284 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %282, i32 %8
  %285 = load i32, i32 addrspace(3)* %284, align 4, !tbaa !5
  %286 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %282, i32 %8
  %287 = load i32, i32 addrspace(3)* %286, align 4, !tbaa !5
  %288 = add nsw i32 %287, %285
  %289 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %283, i32 %8
  %290 = load i32, i32 addrspace(3)* %289, align 4, !tbaa !5
  %291 = sub nsw i32 %290, %3
  %292 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %282, i32 %123
  %293 = load i32, i32 addrspace(3)* %292, align 4, !tbaa !5
  %294 = sub nsw i32 %293, %3
  %295 = tail call i32 @llvm.smax.i32(i32 %288, i32 %291)
  %296 = tail call i32 @llvm.smax.i32(i32 %295, i32 %294)
  %297 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %283, i32 %123
  store i32 %296, i32 addrspace(3)* %297, align 4, !tbaa !5
  br label %298

298:                                              ; preds = %281, %279
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %299 = icmp ugt i32 %8, 9
  br i1 %299, label %317, label %300

300:                                              ; preds = %298
  %301 = sub nuw nsw i32 9, %8
  %302 = sub nuw nsw i32 10, %8
  %303 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %301, i32 %8
  %304 = load i32, i32 addrspace(3)* %303, align 4, !tbaa !5
  %305 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %301, i32 %8
  %306 = load i32, i32 addrspace(3)* %305, align 4, !tbaa !5
  %307 = add nsw i32 %306, %304
  %308 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %302, i32 %8
  %309 = load i32, i32 addrspace(3)* %308, align 4, !tbaa !5
  %310 = sub nsw i32 %309, %3
  %311 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %301, i32 %123
  %312 = load i32, i32 addrspace(3)* %311, align 4, !tbaa !5
  %313 = sub nsw i32 %312, %3
  %314 = tail call i32 @llvm.smax.i32(i32 %307, i32 %310)
  %315 = tail call i32 @llvm.smax.i32(i32 %314, i32 %313)
  %316 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %302, i32 %123
  store i32 %315, i32 addrspace(3)* %316, align 4, !tbaa !5
  br label %317

317:                                              ; preds = %300, %298
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %318 = icmp ugt i32 %8, 10
  br i1 %318, label %336, label %319

319:                                              ; preds = %317
  %320 = sub nuw nsw i32 10, %8
  %321 = sub nuw nsw i32 11, %8
  %322 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %320, i32 %8
  %323 = load i32, i32 addrspace(3)* %322, align 4, !tbaa !5
  %324 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %320, i32 %8
  %325 = load i32, i32 addrspace(3)* %324, align 4, !tbaa !5
  %326 = add nsw i32 %325, %323
  %327 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %321, i32 %8
  %328 = load i32, i32 addrspace(3)* %327, align 4, !tbaa !5
  %329 = sub nsw i32 %328, %3
  %330 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %320, i32 %123
  %331 = load i32, i32 addrspace(3)* %330, align 4, !tbaa !5
  %332 = sub nsw i32 %331, %3
  %333 = tail call i32 @llvm.smax.i32(i32 %326, i32 %329)
  %334 = tail call i32 @llvm.smax.i32(i32 %333, i32 %332)
  %335 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %321, i32 %123
  store i32 %334, i32 addrspace(3)* %335, align 4, !tbaa !5
  br label %336

336:                                              ; preds = %319, %317
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %337 = icmp ugt i32 %8, 11
  br i1 %337, label %355, label %338

338:                                              ; preds = %336
  %339 = sub nuw nsw i32 11, %8
  %340 = sub nuw nsw i32 12, %8
  %341 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %339, i32 %8
  %342 = load i32, i32 addrspace(3)* %341, align 4, !tbaa !5
  %343 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %339, i32 %8
  %344 = load i32, i32 addrspace(3)* %343, align 4, !tbaa !5
  %345 = add nsw i32 %344, %342
  %346 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %340, i32 %8
  %347 = load i32, i32 addrspace(3)* %346, align 4, !tbaa !5
  %348 = sub nsw i32 %347, %3
  %349 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %339, i32 %123
  %350 = load i32, i32 addrspace(3)* %349, align 4, !tbaa !5
  %351 = sub nsw i32 %350, %3
  %352 = tail call i32 @llvm.smax.i32(i32 %345, i32 %348)
  %353 = tail call i32 @llvm.smax.i32(i32 %352, i32 %351)
  %354 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %340, i32 %123
  store i32 %353, i32 addrspace(3)* %354, align 4, !tbaa !5
  br label %355

355:                                              ; preds = %338, %336
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %356 = icmp ugt i32 %8, 12
  br i1 %356, label %374, label %357

357:                                              ; preds = %355
  %358 = sub nuw nsw i32 12, %8
  %359 = sub nuw nsw i32 13, %8
  %360 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %358, i32 %8
  %361 = load i32, i32 addrspace(3)* %360, align 4, !tbaa !5
  %362 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %358, i32 %8
  %363 = load i32, i32 addrspace(3)* %362, align 4, !tbaa !5
  %364 = add nsw i32 %363, %361
  %365 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %359, i32 %8
  %366 = load i32, i32 addrspace(3)* %365, align 4, !tbaa !5
  %367 = sub nsw i32 %366, %3
  %368 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %358, i32 %123
  %369 = load i32, i32 addrspace(3)* %368, align 4, !tbaa !5
  %370 = sub nsw i32 %369, %3
  %371 = tail call i32 @llvm.smax.i32(i32 %364, i32 %367)
  %372 = tail call i32 @llvm.smax.i32(i32 %371, i32 %370)
  %373 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %359, i32 %123
  store i32 %372, i32 addrspace(3)* %373, align 4, !tbaa !5
  br label %374

374:                                              ; preds = %357, %355
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %375 = icmp ugt i32 %8, 13
  br i1 %375, label %393, label %376

376:                                              ; preds = %374
  %377 = sub nuw nsw i32 13, %8
  %378 = sub nuw nsw i32 14, %8
  %379 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %377, i32 %8
  %380 = load i32, i32 addrspace(3)* %379, align 4, !tbaa !5
  %381 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %377, i32 %8
  %382 = load i32, i32 addrspace(3)* %381, align 4, !tbaa !5
  %383 = add nsw i32 %382, %380
  %384 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %378, i32 %8
  %385 = load i32, i32 addrspace(3)* %384, align 4, !tbaa !5
  %386 = sub nsw i32 %385, %3
  %387 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %377, i32 %123
  %388 = load i32, i32 addrspace(3)* %387, align 4, !tbaa !5
  %389 = sub nsw i32 %388, %3
  %390 = tail call i32 @llvm.smax.i32(i32 %383, i32 %386)
  %391 = tail call i32 @llvm.smax.i32(i32 %390, i32 %389)
  %392 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %378, i32 %123
  store i32 %391, i32 addrspace(3)* %392, align 4, !tbaa !5
  br label %393

393:                                              ; preds = %376, %374
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %394 = icmp ugt i32 %8, 14
  br i1 %394, label %412, label %395

395:                                              ; preds = %393
  %396 = sub nuw nsw i32 14, %8
  %397 = sub nuw nsw i32 15, %8
  %398 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %396, i32 %8
  %399 = load i32, i32 addrspace(3)* %398, align 4, !tbaa !5
  %400 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %396, i32 %8
  %401 = load i32, i32 addrspace(3)* %400, align 4, !tbaa !5
  %402 = add nsw i32 %401, %399
  %403 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %397, i32 %8
  %404 = load i32, i32 addrspace(3)* %403, align 4, !tbaa !5
  %405 = sub nsw i32 %404, %3
  %406 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %396, i32 %123
  %407 = load i32, i32 addrspace(3)* %406, align 4, !tbaa !5
  %408 = sub nsw i32 %407, %3
  %409 = tail call i32 @llvm.smax.i32(i32 %402, i32 %405)
  %410 = tail call i32 @llvm.smax.i32(i32 %409, i32 %408)
  %411 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %397, i32 %123
  store i32 %410, i32 addrspace(3)* %411, align 4, !tbaa !5
  br label %412

412:                                              ; preds = %395, %393
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %413 = icmp ugt i32 %8, 15
  %414 = sub nsw i32 15, %8
  br i1 %413, label %431, label %415

415:                                              ; preds = %412
  %416 = sub nuw nsw i32 16, %8
  %417 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %8
  %418 = load i32, i32 addrspace(3)* %417, align 4, !tbaa !5
  %419 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %8
  %420 = load i32, i32 addrspace(3)* %419, align 4, !tbaa !5
  %421 = add nsw i32 %420, %418
  %422 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %416, i32 %8
  %423 = load i32, i32 addrspace(3)* %422, align 4, !tbaa !5
  %424 = sub nsw i32 %423, %3
  %425 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %123
  %426 = load i32, i32 addrspace(3)* %425, align 4, !tbaa !5
  %427 = sub nsw i32 %426, %3
  %428 = tail call i32 @llvm.smax.i32(i32 %421, i32 %424)
  %429 = tail call i32 @llvm.smax.i32(i32 %428, i32 %427)
  %430 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %416, i32 %123
  store i32 %429, i32 addrspace(3)* %430, align 4, !tbaa !5
  br label %431

431:                                              ; preds = %412, %415
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %432 = add nuw nsw i32 %8, 16
  %433 = sub nsw i32 16, %8
  br i1 %394, label %451, label %434

434:                                              ; preds = %431
  %435 = add nuw nsw i32 %8, 2
  %436 = add nuw nsw i32 %8, 1
  %437 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %436
  %438 = load i32, i32 addrspace(3)* %437, align 4, !tbaa !5
  %439 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %436
  %440 = load i32, i32 addrspace(3)* %439, align 4, !tbaa !5
  %441 = add nsw i32 %440, %438
  %442 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %436
  %443 = load i32, i32 addrspace(3)* %442, align 4, !tbaa !5
  %444 = sub nsw i32 %443, %3
  %445 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %435
  %446 = load i32, i32 addrspace(3)* %445, align 4, !tbaa !5
  %447 = sub nsw i32 %446, %3
  %448 = tail call i32 @llvm.smax.i32(i32 %441, i32 %444)
  %449 = tail call i32 @llvm.smax.i32(i32 %448, i32 %447)
  %450 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %435
  store i32 %449, i32 addrspace(3)* %450, align 4, !tbaa !5
  br label %451

451:                                              ; preds = %434, %431
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %375, label %469, label %452

452:                                              ; preds = %451
  %453 = add nuw nsw i32 %8, 3
  %454 = add nuw nsw i32 %8, 2
  %455 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %454
  %456 = load i32, i32 addrspace(3)* %455, align 4, !tbaa !5
  %457 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %454
  %458 = load i32, i32 addrspace(3)* %457, align 4, !tbaa !5
  %459 = add nsw i32 %458, %456
  %460 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %454
  %461 = load i32, i32 addrspace(3)* %460, align 4, !tbaa !5
  %462 = sub nsw i32 %461, %3
  %463 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %453
  %464 = load i32, i32 addrspace(3)* %463, align 4, !tbaa !5
  %465 = sub nsw i32 %464, %3
  %466 = tail call i32 @llvm.smax.i32(i32 %459, i32 %462)
  %467 = tail call i32 @llvm.smax.i32(i32 %466, i32 %465)
  %468 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %453
  store i32 %467, i32 addrspace(3)* %468, align 4, !tbaa !5
  br label %469

469:                                              ; preds = %452, %451
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %356, label %487, label %470

470:                                              ; preds = %469
  %471 = add nuw nsw i32 %8, 4
  %472 = add nuw nsw i32 %8, 3
  %473 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %472
  %474 = load i32, i32 addrspace(3)* %473, align 4, !tbaa !5
  %475 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %472
  %476 = load i32, i32 addrspace(3)* %475, align 4, !tbaa !5
  %477 = add nsw i32 %476, %474
  %478 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %472
  %479 = load i32, i32 addrspace(3)* %478, align 4, !tbaa !5
  %480 = sub nsw i32 %479, %3
  %481 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %471
  %482 = load i32, i32 addrspace(3)* %481, align 4, !tbaa !5
  %483 = sub nsw i32 %482, %3
  %484 = tail call i32 @llvm.smax.i32(i32 %477, i32 %480)
  %485 = tail call i32 @llvm.smax.i32(i32 %484, i32 %483)
  %486 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %471
  store i32 %485, i32 addrspace(3)* %486, align 4, !tbaa !5
  br label %487

487:                                              ; preds = %470, %469
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %337, label %505, label %488

488:                                              ; preds = %487
  %489 = add nuw nsw i32 %8, 5
  %490 = add nuw nsw i32 %8, 4
  %491 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %490
  %492 = load i32, i32 addrspace(3)* %491, align 4, !tbaa !5
  %493 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %490
  %494 = load i32, i32 addrspace(3)* %493, align 4, !tbaa !5
  %495 = add nsw i32 %494, %492
  %496 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %490
  %497 = load i32, i32 addrspace(3)* %496, align 4, !tbaa !5
  %498 = sub nsw i32 %497, %3
  %499 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %489
  %500 = load i32, i32 addrspace(3)* %499, align 4, !tbaa !5
  %501 = sub nsw i32 %500, %3
  %502 = tail call i32 @llvm.smax.i32(i32 %495, i32 %498)
  %503 = tail call i32 @llvm.smax.i32(i32 %502, i32 %501)
  %504 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %489
  store i32 %503, i32 addrspace(3)* %504, align 4, !tbaa !5
  br label %505

505:                                              ; preds = %488, %487
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %318, label %523, label %506

506:                                              ; preds = %505
  %507 = add nuw nsw i32 %8, 6
  %508 = add nuw nsw i32 %8, 5
  %509 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %508
  %510 = load i32, i32 addrspace(3)* %509, align 4, !tbaa !5
  %511 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %508
  %512 = load i32, i32 addrspace(3)* %511, align 4, !tbaa !5
  %513 = add nsw i32 %512, %510
  %514 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %508
  %515 = load i32, i32 addrspace(3)* %514, align 4, !tbaa !5
  %516 = sub nsw i32 %515, %3
  %517 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %507
  %518 = load i32, i32 addrspace(3)* %517, align 4, !tbaa !5
  %519 = sub nsw i32 %518, %3
  %520 = tail call i32 @llvm.smax.i32(i32 %513, i32 %516)
  %521 = tail call i32 @llvm.smax.i32(i32 %520, i32 %519)
  %522 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %507
  store i32 %521, i32 addrspace(3)* %522, align 4, !tbaa !5
  br label %523

523:                                              ; preds = %506, %505
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %299, label %541, label %524

524:                                              ; preds = %523
  %525 = add nuw nsw i32 %8, 7
  %526 = add nuw nsw i32 %8, 6
  %527 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %526
  %528 = load i32, i32 addrspace(3)* %527, align 4, !tbaa !5
  %529 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %526
  %530 = load i32, i32 addrspace(3)* %529, align 4, !tbaa !5
  %531 = add nsw i32 %530, %528
  %532 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %526
  %533 = load i32, i32 addrspace(3)* %532, align 4, !tbaa !5
  %534 = sub nsw i32 %533, %3
  %535 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %525
  %536 = load i32, i32 addrspace(3)* %535, align 4, !tbaa !5
  %537 = sub nsw i32 %536, %3
  %538 = tail call i32 @llvm.smax.i32(i32 %531, i32 %534)
  %539 = tail call i32 @llvm.smax.i32(i32 %538, i32 %537)
  %540 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %525
  store i32 %539, i32 addrspace(3)* %540, align 4, !tbaa !5
  br label %541

541:                                              ; preds = %524, %523
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %280, label %559, label %542

542:                                              ; preds = %541
  %543 = add nuw nsw i32 %8, 8
  %544 = add nuw nsw i32 %8, 7
  %545 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %544
  %546 = load i32, i32 addrspace(3)* %545, align 4, !tbaa !5
  %547 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %544
  %548 = load i32, i32 addrspace(3)* %547, align 4, !tbaa !5
  %549 = add nsw i32 %548, %546
  %550 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %544
  %551 = load i32, i32 addrspace(3)* %550, align 4, !tbaa !5
  %552 = sub nsw i32 %551, %3
  %553 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %543
  %554 = load i32, i32 addrspace(3)* %553, align 4, !tbaa !5
  %555 = sub nsw i32 %554, %3
  %556 = tail call i32 @llvm.smax.i32(i32 %549, i32 %552)
  %557 = tail call i32 @llvm.smax.i32(i32 %556, i32 %555)
  %558 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %543
  store i32 %557, i32 addrspace(3)* %558, align 4, !tbaa !5
  br label %559

559:                                              ; preds = %542, %541
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %261, label %577, label %560

560:                                              ; preds = %559
  %561 = add nuw nsw i32 %8, 9
  %562 = add nuw nsw i32 %8, 8
  %563 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %562
  %564 = load i32, i32 addrspace(3)* %563, align 4, !tbaa !5
  %565 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %562
  %566 = load i32, i32 addrspace(3)* %565, align 4, !tbaa !5
  %567 = add nsw i32 %566, %564
  %568 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %562
  %569 = load i32, i32 addrspace(3)* %568, align 4, !tbaa !5
  %570 = sub nsw i32 %569, %3
  %571 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %561
  %572 = load i32, i32 addrspace(3)* %571, align 4, !tbaa !5
  %573 = sub nsw i32 %572, %3
  %574 = tail call i32 @llvm.smax.i32(i32 %567, i32 %570)
  %575 = tail call i32 @llvm.smax.i32(i32 %574, i32 %573)
  %576 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %561
  store i32 %575, i32 addrspace(3)* %576, align 4, !tbaa !5
  br label %577

577:                                              ; preds = %560, %559
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %242, label %595, label %578

578:                                              ; preds = %577
  %579 = add nuw nsw i32 %8, 10
  %580 = add nuw nsw i32 %8, 9
  %581 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %580
  %582 = load i32, i32 addrspace(3)* %581, align 4, !tbaa !5
  %583 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %580
  %584 = load i32, i32 addrspace(3)* %583, align 4, !tbaa !5
  %585 = add nsw i32 %584, %582
  %586 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %580
  %587 = load i32, i32 addrspace(3)* %586, align 4, !tbaa !5
  %588 = sub nsw i32 %587, %3
  %589 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %579
  %590 = load i32, i32 addrspace(3)* %589, align 4, !tbaa !5
  %591 = sub nsw i32 %590, %3
  %592 = tail call i32 @llvm.smax.i32(i32 %585, i32 %588)
  %593 = tail call i32 @llvm.smax.i32(i32 %592, i32 %591)
  %594 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %579
  store i32 %593, i32 addrspace(3)* %594, align 4, !tbaa !5
  br label %595

595:                                              ; preds = %578, %577
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %223, label %613, label %596

596:                                              ; preds = %595
  %597 = add nuw nsw i32 %8, 11
  %598 = add nuw nsw i32 %8, 10
  %599 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %598
  %600 = load i32, i32 addrspace(3)* %599, align 4, !tbaa !5
  %601 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %598
  %602 = load i32, i32 addrspace(3)* %601, align 4, !tbaa !5
  %603 = add nsw i32 %602, %600
  %604 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %598
  %605 = load i32, i32 addrspace(3)* %604, align 4, !tbaa !5
  %606 = sub nsw i32 %605, %3
  %607 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %597
  %608 = load i32, i32 addrspace(3)* %607, align 4, !tbaa !5
  %609 = sub nsw i32 %608, %3
  %610 = tail call i32 @llvm.smax.i32(i32 %603, i32 %606)
  %611 = tail call i32 @llvm.smax.i32(i32 %610, i32 %609)
  %612 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %597
  store i32 %611, i32 addrspace(3)* %612, align 4, !tbaa !5
  br label %613

613:                                              ; preds = %596, %595
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %204, label %631, label %614

614:                                              ; preds = %613
  %615 = add nuw nsw i32 %8, 12
  %616 = add nuw nsw i32 %8, 11
  %617 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %616
  %618 = load i32, i32 addrspace(3)* %617, align 4, !tbaa !5
  %619 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %616
  %620 = load i32, i32 addrspace(3)* %619, align 4, !tbaa !5
  %621 = add nsw i32 %620, %618
  %622 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %616
  %623 = load i32, i32 addrspace(3)* %622, align 4, !tbaa !5
  %624 = sub nsw i32 %623, %3
  %625 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %615
  %626 = load i32, i32 addrspace(3)* %625, align 4, !tbaa !5
  %627 = sub nsw i32 %626, %3
  %628 = tail call i32 @llvm.smax.i32(i32 %621, i32 %624)
  %629 = tail call i32 @llvm.smax.i32(i32 %628, i32 %627)
  %630 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %615
  store i32 %629, i32 addrspace(3)* %630, align 4, !tbaa !5
  br label %631

631:                                              ; preds = %614, %613
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %185, label %649, label %632

632:                                              ; preds = %631
  %633 = add nuw nsw i32 %8, 13
  %634 = add nuw nsw i32 %8, 12
  %635 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %634
  %636 = load i32, i32 addrspace(3)* %635, align 4, !tbaa !5
  %637 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %634
  %638 = load i32, i32 addrspace(3)* %637, align 4, !tbaa !5
  %639 = add nsw i32 %638, %636
  %640 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %634
  %641 = load i32, i32 addrspace(3)* %640, align 4, !tbaa !5
  %642 = sub nsw i32 %641, %3
  %643 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %633
  %644 = load i32, i32 addrspace(3)* %643, align 4, !tbaa !5
  %645 = sub nsw i32 %644, %3
  %646 = tail call i32 @llvm.smax.i32(i32 %639, i32 %642)
  %647 = tail call i32 @llvm.smax.i32(i32 %646, i32 %645)
  %648 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %633
  store i32 %647, i32 addrspace(3)* %648, align 4, !tbaa !5
  br label %649

649:                                              ; preds = %632, %631
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %166, label %667, label %650

650:                                              ; preds = %649
  %651 = add nuw nsw i32 %8, 14
  %652 = add nuw nsw i32 %8, 13
  %653 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %652
  %654 = load i32, i32 addrspace(3)* %653, align 4, !tbaa !5
  %655 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %652
  %656 = load i32, i32 addrspace(3)* %655, align 4, !tbaa !5
  %657 = add nsw i32 %656, %654
  %658 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %652
  %659 = load i32, i32 addrspace(3)* %658, align 4, !tbaa !5
  %660 = sub nsw i32 %659, %3
  %661 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %651
  %662 = load i32, i32 addrspace(3)* %661, align 4, !tbaa !5
  %663 = sub nsw i32 %662, %3
  %664 = tail call i32 @llvm.smax.i32(i32 %657, i32 %660)
  %665 = tail call i32 @llvm.smax.i32(i32 %664, i32 %663)
  %666 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %651
  store i32 %665, i32 addrspace(3)* %666, align 4, !tbaa !5
  br label %667

667:                                              ; preds = %650, %649
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %147, label %685, label %668

668:                                              ; preds = %667
  %669 = add nuw nsw i32 %8, 15
  %670 = add nuw nsw i32 %8, 14
  %671 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %670
  %672 = load i32, i32 addrspace(3)* %671, align 4, !tbaa !5
  %673 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %670
  %674 = load i32, i32 addrspace(3)* %673, align 4, !tbaa !5
  %675 = add nsw i32 %674, %672
  %676 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %670
  %677 = load i32, i32 addrspace(3)* %676, align 4, !tbaa !5
  %678 = sub nsw i32 %677, %3
  %679 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %669
  %680 = load i32, i32 addrspace(3)* %679, align 4, !tbaa !5
  %681 = sub nsw i32 %680, %3
  %682 = tail call i32 @llvm.smax.i32(i32 %675, i32 %678)
  %683 = tail call i32 @llvm.smax.i32(i32 %682, i32 %681)
  %684 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %669
  store i32 %683, i32 addrspace(3)* %684, align 4, !tbaa !5
  br label %685

685:                                              ; preds = %668, %667
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %129, label %686, label %702

686:                                              ; preds = %685
  %687 = add nuw nsw i32 %8, 15
  %688 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %687
  %689 = load i32, i32 addrspace(3)* %688, align 4, !tbaa !5
  %690 = getelementptr inbounds [16 x [16 x i32]], [16 x [16 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE3ref, i32 0, i32 %414, i32 %687
  %691 = load i32, i32 addrspace(3)* %690, align 4, !tbaa !5
  %692 = add nsw i32 %691, %689
  %693 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %687
  %694 = load i32, i32 addrspace(3)* %693, align 4, !tbaa !5
  %695 = sub nsw i32 %694, %3
  %696 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %414, i32 %432
  %697 = load i32, i32 addrspace(3)* %696, align 4, !tbaa !5
  %698 = sub nsw i32 %697, %3
  %699 = tail call i32 @llvm.smax.i32(i32 %692, i32 %695)
  %700 = tail call i32 @llvm.smax.i32(i32 %699, i32 %698)
  %701 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 %433, i32 %432
  store i32 %700, i32 addrspace(3)* %701, align 4, !tbaa !5
  br label %702

702:                                              ; preds = %686, %685
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %703 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 1, i32 %123
  %704 = load i32, i32 addrspace(3)* %703, align 4, !tbaa !5
  %705 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %18
  store i32 %704, i32 addrspace(1)* %705, align 4, !tbaa !5
  %706 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 2, i32 %123
  %707 = load i32, i32 addrspace(3)* %706, align 4, !tbaa !5
  %708 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %23
  store i32 %707, i32 addrspace(1)* %708, align 4, !tbaa !5
  %709 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 3, i32 %123
  %710 = load i32, i32 addrspace(3)* %709, align 4, !tbaa !5
  %711 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %29
  store i32 %710, i32 addrspace(1)* %711, align 4, !tbaa !5
  %712 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 4, i32 %123
  %713 = load i32, i32 addrspace(3)* %712, align 4, !tbaa !5
  %714 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  store i32 %713, i32 addrspace(1)* %714, align 4, !tbaa !5
  %715 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 5, i32 %123
  %716 = load i32, i32 addrspace(3)* %715, align 4, !tbaa !5
  %717 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %41
  store i32 %716, i32 addrspace(1)* %717, align 4, !tbaa !5
  %718 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 6, i32 %123
  %719 = load i32, i32 addrspace(3)* %718, align 4, !tbaa !5
  %720 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  store i32 %719, i32 addrspace(1)* %720, align 4, !tbaa !5
  %721 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 7, i32 %123
  %722 = load i32, i32 addrspace(3)* %721, align 4, !tbaa !5
  %723 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  store i32 %722, i32 addrspace(1)* %723, align 4, !tbaa !5
  %724 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 8, i32 %123
  %725 = load i32, i32 addrspace(3)* %724, align 4, !tbaa !5
  %726 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %59
  store i32 %725, i32 addrspace(1)* %726, align 4, !tbaa !5
  %727 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 9, i32 %123
  %728 = load i32, i32 addrspace(3)* %727, align 4, !tbaa !5
  %729 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %65
  store i32 %728, i32 addrspace(1)* %729, align 4, !tbaa !5
  %730 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 10, i32 %123
  %731 = load i32, i32 addrspace(3)* %730, align 4, !tbaa !5
  %732 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %71
  store i32 %731, i32 addrspace(1)* %732, align 4, !tbaa !5
  %733 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 11, i32 %123
  %734 = load i32, i32 addrspace(3)* %733, align 4, !tbaa !5
  %735 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %77
  store i32 %734, i32 addrspace(1)* %735, align 4, !tbaa !5
  %736 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 12, i32 %123
  %737 = load i32, i32 addrspace(3)* %736, align 4, !tbaa !5
  %738 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %83
  store i32 %737, i32 addrspace(1)* %738, align 4, !tbaa !5
  %739 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 13, i32 %123
  %740 = load i32, i32 addrspace(3)* %739, align 4, !tbaa !5
  %741 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %89
  store i32 %740, i32 addrspace(1)* %741, align 4, !tbaa !5
  %742 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 14, i32 %123
  %743 = load i32, i32 addrspace(3)* %742, align 4, !tbaa !5
  %744 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %95
  store i32 %743, i32 addrspace(1)* %744, align 4, !tbaa !5
  %745 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 15, i32 %123
  %746 = load i32, i32 addrspace(3)* %745, align 4, !tbaa !5
  %747 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %101
  store i32 %746, i32 addrspace(1)* %747, align 4, !tbaa !5
  %748 = getelementptr inbounds [17 x [17 x i32]], [17 x [17 x i32]] addrspace(3)* @_ZZ20needle_cuda_shared_1PiS_iiiiE4temp, i32 0, i32 16, i32 %123
  %749 = load i32, i32 addrspace(3)* %748, align 4, !tbaa !5
  %750 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %107
  store i32 %749, i32 addrspace(1)* %750, align 4, !tbaa !5
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
