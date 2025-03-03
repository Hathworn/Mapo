; ModuleID = '../data/hip_kernels/175/65/main.cu'
source_filename = "../data/hip_kernels/175/65/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13findCentroidsPiiS_S_PjE11localMasses = internal addrspace(3) global [1088 x i32] undef, align 16
@_ZZ13findCentroidsPiiS_S_PjE11localCounts = internal addrspace(3) global [64 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13findCentroidsPiiS_S_Pj(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture %3, i32 addrspace(1)* nocapture %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp ult i32 %13, 64
  br i1 %15, label %16, label %51

16:                                               ; preds = %5
  %17 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %13
  store i32 0, i32 addrspace(3)* %17, align 4, !tbaa !7
  %18 = add nuw nsw i32 %13, 64
  %19 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %18
  store i32 0, i32 addrspace(3)* %19, align 4, !tbaa !7
  %20 = add nuw nsw i32 %13, 128
  %21 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %20
  store i32 0, i32 addrspace(3)* %21, align 4, !tbaa !7
  %22 = add nuw nsw i32 %13, 192
  %23 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %22
  store i32 0, i32 addrspace(3)* %23, align 4, !tbaa !7
  %24 = add nuw nsw i32 %13, 256
  %25 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %24
  store i32 0, i32 addrspace(3)* %25, align 4, !tbaa !7
  %26 = add nuw nsw i32 %13, 320
  %27 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %26
  store i32 0, i32 addrspace(3)* %27, align 4, !tbaa !7
  %28 = add nuw nsw i32 %13, 384
  %29 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %28
  store i32 0, i32 addrspace(3)* %29, align 4, !tbaa !7
  %30 = add nuw nsw i32 %13, 448
  %31 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %30
  store i32 0, i32 addrspace(3)* %31, align 4, !tbaa !7
  %32 = add nuw nsw i32 %13, 512
  %33 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %32
  store i32 0, i32 addrspace(3)* %33, align 4, !tbaa !7
  %34 = add nuw nsw i32 %13, 576
  %35 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %34
  store i32 0, i32 addrspace(3)* %35, align 4, !tbaa !7
  %36 = add nuw nsw i32 %13, 640
  %37 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %36
  store i32 0, i32 addrspace(3)* %37, align 4, !tbaa !7
  %38 = add nuw nsw i32 %13, 704
  %39 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %38
  store i32 0, i32 addrspace(3)* %39, align 4, !tbaa !7
  %40 = add nuw nsw i32 %13, 768
  %41 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %40
  store i32 0, i32 addrspace(3)* %41, align 4, !tbaa !7
  %42 = add nuw nsw i32 %13, 832
  %43 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %42
  store i32 0, i32 addrspace(3)* %43, align 4, !tbaa !7
  %44 = add nuw nsw i32 %13, 896
  %45 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %44
  store i32 0, i32 addrspace(3)* %45, align 4, !tbaa !7
  %46 = add nuw nsw i32 %13, 960
  %47 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %46
  store i32 0, i32 addrspace(3)* %47, align 4, !tbaa !7
  %48 = or i32 %13, 1024
  %49 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %48
  store i32 0, i32 addrspace(3)* %49, align 4, !tbaa !7
  %50 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localCounts, i32 0, i32 %13
  store i32 0, i32 addrspace(3)* %50, align 4, !tbaa !7
  br label %51

51:                                               ; preds = %16, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp slt i32 %14, %1
  br i1 %52, label %53, label %157

53:                                               ; preds = %51
  %54 = sext i32 %14 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !5
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !7, !amdgpu.noclobber !5
  %59 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %56
  %60 = atomicrmw add i32 addrspace(3)* %59, i32 %58 syncscope("agent-one-as") monotonic, align 4
  %61 = add nsw i32 %14, %1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %62
  %64 = load i32, i32 addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !5
  %65 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 64), i32 %56
  %66 = atomicrmw add i32 addrspace(3)* %65, i32 %64 syncscope("agent-one-as") monotonic, align 4
  %67 = add nsw i32 %61, %1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !5
  %71 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 128), i32 %56
  %72 = atomicrmw add i32 addrspace(3)* %71, i32 %70 syncscope("agent-one-as") monotonic, align 4
  %73 = add nsw i32 %67, %1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %74
  %76 = load i32, i32 addrspace(1)* %75, align 4, !tbaa !7, !amdgpu.noclobber !5
  %77 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 192), i32 %56
  %78 = atomicrmw add i32 addrspace(3)* %77, i32 %76 syncscope("agent-one-as") monotonic, align 4
  %79 = add nsw i32 %73, %1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %80
  %82 = load i32, i32 addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 256), i32 %56
  %84 = atomicrmw add i32 addrspace(3)* %83, i32 %82 syncscope("agent-one-as") monotonic, align 4
  %85 = add nsw i32 %79, %1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %86
  %88 = load i32, i32 addrspace(1)* %87, align 4, !tbaa !7, !amdgpu.noclobber !5
  %89 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 320), i32 %56
  %90 = atomicrmw add i32 addrspace(3)* %89, i32 %88 syncscope("agent-one-as") monotonic, align 4
  %91 = add nsw i32 %85, %1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %92
  %94 = load i32, i32 addrspace(1)* %93, align 4, !tbaa !7, !amdgpu.noclobber !5
  %95 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 384), i32 %56
  %96 = atomicrmw add i32 addrspace(3)* %95, i32 %94 syncscope("agent-one-as") monotonic, align 4
  %97 = add nsw i32 %91, %1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7, !amdgpu.noclobber !5
  %101 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 448), i32 %56
  %102 = atomicrmw add i32 addrspace(3)* %101, i32 %100 syncscope("agent-one-as") monotonic, align 4
  %103 = add nsw i32 %97, %1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %104
  %106 = load i32, i32 addrspace(1)* %105, align 4, !tbaa !7, !amdgpu.noclobber !5
  %107 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 512), i32 %56
  %108 = atomicrmw add i32 addrspace(3)* %107, i32 %106 syncscope("agent-one-as") monotonic, align 4
  %109 = add nsw i32 %103, %1
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %110
  %112 = load i32, i32 addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 576), i32 %56
  %114 = atomicrmw add i32 addrspace(3)* %113, i32 %112 syncscope("agent-one-as") monotonic, align 4
  %115 = add nsw i32 %109, %1
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %116
  %118 = load i32, i32 addrspace(1)* %117, align 4, !tbaa !7, !amdgpu.noclobber !5
  %119 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 640), i32 %56
  %120 = atomicrmw add i32 addrspace(3)* %119, i32 %118 syncscope("agent-one-as") monotonic, align 4
  %121 = add nsw i32 %115, %1
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %122
  %124 = load i32, i32 addrspace(1)* %123, align 4, !tbaa !7, !amdgpu.noclobber !5
  %125 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 704), i32 %56
  %126 = atomicrmw add i32 addrspace(3)* %125, i32 %124 syncscope("agent-one-as") monotonic, align 4
  %127 = add nsw i32 %121, %1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %128
  %130 = load i32, i32 addrspace(1)* %129, align 4, !tbaa !7, !amdgpu.noclobber !5
  %131 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 768), i32 %56
  %132 = atomicrmw add i32 addrspace(3)* %131, i32 %130 syncscope("agent-one-as") monotonic, align 4
  %133 = add nsw i32 %127, %1
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %134
  %136 = load i32, i32 addrspace(1)* %135, align 4, !tbaa !7, !amdgpu.noclobber !5
  %137 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 832), i32 %56
  %138 = atomicrmw add i32 addrspace(3)* %137, i32 %136 syncscope("agent-one-as") monotonic, align 4
  %139 = add nsw i32 %133, %1
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %140
  %142 = load i32, i32 addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  %143 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 896), i32 %56
  %144 = atomicrmw add i32 addrspace(3)* %143, i32 %142 syncscope("agent-one-as") monotonic, align 4
  %145 = add nsw i32 %139, %1
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %146
  %148 = load i32, i32 addrspace(1)* %147, align 4, !tbaa !7, !amdgpu.noclobber !5
  %149 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 960), i32 %56
  %150 = atomicrmw add i32 addrspace(3)* %149, i32 %148 syncscope("agent-one-as") monotonic, align 4
  %151 = add nsw i32 %145, %1
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %152
  %154 = load i32, i32 addrspace(1)* %153, align 4, !tbaa !7, !amdgpu.noclobber !5
  %155 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr inbounds ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 1024), i32 %56
  %156 = atomicrmw add i32 addrspace(3)* %155, i32 %154 syncscope("agent-one-as") monotonic, align 4
  br label %157

157:                                              ; preds = %53, %51
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %15, label %158, label %244

158:                                              ; preds = %157
  %159 = zext i32 %13 to i64
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %159
  %161 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %13
  %162 = load i32, i32 addrspace(3)* %161, align 4, !tbaa !7
  %163 = atomicrmw add i32 addrspace(1)* %160, i32 %162 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %161, align 4, !tbaa !7
  %164 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 64
  %165 = add nuw nsw i32 %13, 64
  %166 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %165
  %167 = load i32, i32 addrspace(3)* %166, align 4, !tbaa !7
  %168 = atomicrmw add i32 addrspace(1)* %164, i32 %167 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %166, align 4, !tbaa !7
  %169 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 128
  %170 = add nuw nsw i32 %13, 128
  %171 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %170
  %172 = load i32, i32 addrspace(3)* %171, align 4, !tbaa !7
  %173 = atomicrmw add i32 addrspace(1)* %169, i32 %172 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %171, align 4, !tbaa !7
  %174 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 192
  %175 = add nuw nsw i32 %13, 192
  %176 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %175
  %177 = load i32, i32 addrspace(3)* %176, align 4, !tbaa !7
  %178 = atomicrmw add i32 addrspace(1)* %174, i32 %177 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %176, align 4, !tbaa !7
  %179 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 256
  %180 = add nuw nsw i32 %13, 256
  %181 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %180
  %182 = load i32, i32 addrspace(3)* %181, align 4, !tbaa !7
  %183 = atomicrmw add i32 addrspace(1)* %179, i32 %182 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %181, align 4, !tbaa !7
  %184 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 320
  %185 = add nuw nsw i32 %13, 320
  %186 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %185
  %187 = load i32, i32 addrspace(3)* %186, align 4, !tbaa !7
  %188 = atomicrmw add i32 addrspace(1)* %184, i32 %187 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %186, align 4, !tbaa !7
  %189 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 384
  %190 = add nuw nsw i32 %13, 384
  %191 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %190
  %192 = load i32, i32 addrspace(3)* %191, align 4, !tbaa !7
  %193 = atomicrmw add i32 addrspace(1)* %189, i32 %192 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %191, align 4, !tbaa !7
  %194 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 448
  %195 = add nuw nsw i32 %13, 448
  %196 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %195
  %197 = load i32, i32 addrspace(3)* %196, align 4, !tbaa !7
  %198 = atomicrmw add i32 addrspace(1)* %194, i32 %197 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %196, align 4, !tbaa !7
  %199 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 512
  %200 = add nuw nsw i32 %13, 512
  %201 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %200
  %202 = load i32, i32 addrspace(3)* %201, align 4, !tbaa !7
  %203 = atomicrmw add i32 addrspace(1)* %199, i32 %202 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %201, align 4, !tbaa !7
  %204 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 576
  %205 = add nuw nsw i32 %13, 576
  %206 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %205
  %207 = load i32, i32 addrspace(3)* %206, align 4, !tbaa !7
  %208 = atomicrmw add i32 addrspace(1)* %204, i32 %207 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %206, align 4, !tbaa !7
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 640
  %210 = add nuw nsw i32 %13, 640
  %211 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %210
  %212 = load i32, i32 addrspace(3)* %211, align 4, !tbaa !7
  %213 = atomicrmw add i32 addrspace(1)* %209, i32 %212 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %211, align 4, !tbaa !7
  %214 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 704
  %215 = add nuw nsw i32 %13, 704
  %216 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %215
  %217 = load i32, i32 addrspace(3)* %216, align 4, !tbaa !7
  %218 = atomicrmw add i32 addrspace(1)* %214, i32 %217 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %216, align 4, !tbaa !7
  %219 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 768
  %220 = add nuw nsw i32 %13, 768
  %221 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %220
  %222 = load i32, i32 addrspace(3)* %221, align 4, !tbaa !7
  %223 = atomicrmw add i32 addrspace(1)* %219, i32 %222 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %221, align 4, !tbaa !7
  %224 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 832
  %225 = add nuw nsw i32 %13, 832
  %226 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %225
  %227 = load i32, i32 addrspace(3)* %226, align 4, !tbaa !7
  %228 = atomicrmw add i32 addrspace(1)* %224, i32 %227 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %226, align 4, !tbaa !7
  %229 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 896
  %230 = add nuw nsw i32 %13, 896
  %231 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %230
  %232 = load i32, i32 addrspace(3)* %231, align 4, !tbaa !7
  %233 = atomicrmw add i32 addrspace(1)* %229, i32 %232 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %231, align 4, !tbaa !7
  %234 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 960
  %235 = add nuw nsw i32 %13, 960
  %236 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %235
  %237 = load i32, i32 addrspace(3)* %236, align 4, !tbaa !7
  %238 = atomicrmw add i32 addrspace(1)* %234, i32 %237 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %236, align 4, !tbaa !7
  %239 = getelementptr inbounds i32, i32 addrspace(1)* %160, i64 1024
  %240 = or i32 %13, 1024
  %241 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %240
  %242 = load i32, i32 addrspace(3)* %241, align 4, !tbaa !7
  %243 = atomicrmw add i32 addrspace(1)* %239, i32 %242 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %241, align 4, !tbaa !7
  br label %244

244:                                              ; preds = %158, %157
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %52, label %245, label %354

245:                                              ; preds = %244
  %246 = sext i32 %14 to i64
  %247 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %246
  %248 = load i32, i32 addrspace(1)* %247, align 4, !tbaa !7
  %249 = mul nsw i32 %1, 17
  %250 = add nsw i32 %14, %249
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %251
  %253 = load i32, i32 addrspace(1)* %252, align 4, !tbaa !7
  %254 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 %248
  %255 = atomicrmw add i32 addrspace(3)* %254, i32 %253 syncscope("agent-one-as") monotonic, align 4
  %256 = add nsw i32 %250, %1
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %257
  %259 = load i32, i32 addrspace(1)* %258, align 4, !tbaa !7
  %260 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 64), i32 %248
  %261 = atomicrmw add i32 addrspace(3)* %260, i32 %259 syncscope("agent-one-as") monotonic, align 4
  %262 = add nsw i32 %256, %1
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %263
  %265 = load i32, i32 addrspace(1)* %264, align 4, !tbaa !7
  %266 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 128), i32 %248
  %267 = atomicrmw add i32 addrspace(3)* %266, i32 %265 syncscope("agent-one-as") monotonic, align 4
  %268 = add nsw i32 %262, %1
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %269
  %271 = load i32, i32 addrspace(1)* %270, align 4, !tbaa !7
  %272 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 192), i32 %248
  %273 = atomicrmw add i32 addrspace(3)* %272, i32 %271 syncscope("agent-one-as") monotonic, align 4
  %274 = add nsw i32 %268, %1
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %275
  %277 = load i32, i32 addrspace(1)* %276, align 4, !tbaa !7
  %278 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 256), i32 %248
  %279 = atomicrmw add i32 addrspace(3)* %278, i32 %277 syncscope("agent-one-as") monotonic, align 4
  %280 = add nsw i32 %274, %1
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %281
  %283 = load i32, i32 addrspace(1)* %282, align 4, !tbaa !7
  %284 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 320), i32 %248
  %285 = atomicrmw add i32 addrspace(3)* %284, i32 %283 syncscope("agent-one-as") monotonic, align 4
  %286 = add nsw i32 %280, %1
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %287
  %289 = load i32, i32 addrspace(1)* %288, align 4, !tbaa !7
  %290 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 384), i32 %248
  %291 = atomicrmw add i32 addrspace(3)* %290, i32 %289 syncscope("agent-one-as") monotonic, align 4
  %292 = add nsw i32 %286, %1
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %293
  %295 = load i32, i32 addrspace(1)* %294, align 4, !tbaa !7
  %296 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 448), i32 %248
  %297 = atomicrmw add i32 addrspace(3)* %296, i32 %295 syncscope("agent-one-as") monotonic, align 4
  %298 = add nsw i32 %292, %1
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %299
  %301 = load i32, i32 addrspace(1)* %300, align 4, !tbaa !7
  %302 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 512), i32 %248
  %303 = atomicrmw add i32 addrspace(3)* %302, i32 %301 syncscope("agent-one-as") monotonic, align 4
  %304 = add nsw i32 %298, %1
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %305
  %307 = load i32, i32 addrspace(1)* %306, align 4, !tbaa !7
  %308 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 576), i32 %248
  %309 = atomicrmw add i32 addrspace(3)* %308, i32 %307 syncscope("agent-one-as") monotonic, align 4
  %310 = add nsw i32 %304, %1
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %311
  %313 = load i32, i32 addrspace(1)* %312, align 4, !tbaa !7
  %314 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 640), i32 %248
  %315 = atomicrmw add i32 addrspace(3)* %314, i32 %313 syncscope("agent-one-as") monotonic, align 4
  %316 = add nsw i32 %310, %1
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %317
  %319 = load i32, i32 addrspace(1)* %318, align 4, !tbaa !7
  %320 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 704), i32 %248
  %321 = atomicrmw add i32 addrspace(3)* %320, i32 %319 syncscope("agent-one-as") monotonic, align 4
  %322 = add nsw i32 %316, %1
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %323
  %325 = load i32, i32 addrspace(1)* %324, align 4, !tbaa !7
  %326 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 768), i32 %248
  %327 = atomicrmw add i32 addrspace(3)* %326, i32 %325 syncscope("agent-one-as") monotonic, align 4
  %328 = add nsw i32 %322, %1
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %329
  %331 = load i32, i32 addrspace(1)* %330, align 4, !tbaa !7
  %332 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 832), i32 %248
  %333 = atomicrmw add i32 addrspace(3)* %332, i32 %331 syncscope("agent-one-as") monotonic, align 4
  %334 = add nsw i32 %328, %1
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %335
  %337 = load i32, i32 addrspace(1)* %336, align 4, !tbaa !7
  %338 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 896), i32 %248
  %339 = atomicrmw add i32 addrspace(3)* %338, i32 %337 syncscope("agent-one-as") monotonic, align 4
  %340 = add nsw i32 %334, %1
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %341
  %343 = load i32, i32 addrspace(1)* %342, align 4, !tbaa !7
  %344 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 960), i32 %248
  %345 = atomicrmw add i32 addrspace(3)* %344, i32 %343 syncscope("agent-one-as") monotonic, align 4
  %346 = add nsw i32 %340, %1
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %347
  %349 = load i32, i32 addrspace(1)* %348, align 4, !tbaa !7
  %350 = getelementptr inbounds i32, i32 addrspace(3)* getelementptr ([1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 1, i32 1024), i32 %248
  %351 = atomicrmw add i32 addrspace(3)* %350, i32 %349 syncscope("agent-one-as") monotonic, align 4
  %352 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localCounts, i32 0, i32 %248
  %353 = tail call i32 @llvm.amdgcn.atomic.inc.i32.p3i32(i32 addrspace(3)* %352, i32 100000000, i32 2, i32 4, i1 false)
  br label %354

354:                                              ; preds = %245, %244
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %15, label %355, label %447

355:                                              ; preds = %354
  %356 = zext i32 %13 to i64
  %357 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %356
  %358 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1088
  %359 = add nuw nsw i32 %13, 1088
  %360 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %359
  %361 = load i32, i32 addrspace(3)* %360, align 4, !tbaa !7
  %362 = atomicrmw add i32 addrspace(1)* %358, i32 %361 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %360, align 4, !tbaa !7
  %363 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1152
  %364 = add nuw nsw i32 %13, 1152
  %365 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %364
  %366 = load i32, i32 addrspace(3)* %365, align 4, !tbaa !7
  %367 = atomicrmw add i32 addrspace(1)* %363, i32 %366 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %365, align 4, !tbaa !7
  %368 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1216
  %369 = add nuw nsw i32 %13, 1216
  %370 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %369
  %371 = load i32, i32 addrspace(3)* %370, align 4, !tbaa !7
  %372 = atomicrmw add i32 addrspace(1)* %368, i32 %371 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %370, align 4, !tbaa !7
  %373 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1280
  %374 = add nuw nsw i32 %13, 1280
  %375 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %374
  %376 = load i32, i32 addrspace(3)* %375, align 4, !tbaa !7
  %377 = atomicrmw add i32 addrspace(1)* %373, i32 %376 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %375, align 4, !tbaa !7
  %378 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1344
  %379 = add nuw nsw i32 %13, 1344
  %380 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %379
  %381 = load i32, i32 addrspace(3)* %380, align 4, !tbaa !7
  %382 = atomicrmw add i32 addrspace(1)* %378, i32 %381 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %380, align 4, !tbaa !7
  %383 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1408
  %384 = add nuw nsw i32 %13, 1408
  %385 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %384
  %386 = load i32, i32 addrspace(3)* %385, align 4, !tbaa !7
  %387 = atomicrmw add i32 addrspace(1)* %383, i32 %386 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %385, align 4, !tbaa !7
  %388 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1472
  %389 = add nuw nsw i32 %13, 1472
  %390 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %389
  %391 = load i32, i32 addrspace(3)* %390, align 4, !tbaa !7
  %392 = atomicrmw add i32 addrspace(1)* %388, i32 %391 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %390, align 4, !tbaa !7
  %393 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1536
  %394 = add nuw nsw i32 %13, 1536
  %395 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %394
  %396 = load i32, i32 addrspace(3)* %395, align 4, !tbaa !7
  %397 = atomicrmw add i32 addrspace(1)* %393, i32 %396 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %395, align 4, !tbaa !7
  %398 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1600
  %399 = add nuw nsw i32 %13, 1600
  %400 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %399
  %401 = load i32, i32 addrspace(3)* %400, align 4, !tbaa !7
  %402 = atomicrmw add i32 addrspace(1)* %398, i32 %401 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %400, align 4, !tbaa !7
  %403 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1664
  %404 = add nuw nsw i32 %13, 1664
  %405 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %404
  %406 = load i32, i32 addrspace(3)* %405, align 4, !tbaa !7
  %407 = atomicrmw add i32 addrspace(1)* %403, i32 %406 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %405, align 4, !tbaa !7
  %408 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1728
  %409 = add nuw nsw i32 %13, 1728
  %410 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %409
  %411 = load i32, i32 addrspace(3)* %410, align 4, !tbaa !7
  %412 = atomicrmw add i32 addrspace(1)* %408, i32 %411 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %410, align 4, !tbaa !7
  %413 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1792
  %414 = add nuw nsw i32 %13, 1792
  %415 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %414
  %416 = load i32, i32 addrspace(3)* %415, align 4, !tbaa !7
  %417 = atomicrmw add i32 addrspace(1)* %413, i32 %416 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %415, align 4, !tbaa !7
  %418 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1856
  %419 = add nuw nsw i32 %13, 1856
  %420 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %419
  %421 = load i32, i32 addrspace(3)* %420, align 4, !tbaa !7
  %422 = atomicrmw add i32 addrspace(1)* %418, i32 %421 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %420, align 4, !tbaa !7
  %423 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1920
  %424 = add nuw nsw i32 %13, 1920
  %425 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %424
  %426 = load i32, i32 addrspace(3)* %425, align 4, !tbaa !7
  %427 = atomicrmw add i32 addrspace(1)* %423, i32 %426 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %425, align 4, !tbaa !7
  %428 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 1984
  %429 = add nuw nsw i32 %13, 1984
  %430 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %429
  %431 = load i32, i32 addrspace(3)* %430, align 4, !tbaa !7
  %432 = atomicrmw add i32 addrspace(1)* %428, i32 %431 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %430, align 4, !tbaa !7
  %433 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 2048
  %434 = or i32 %13, 2048
  %435 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %434
  %436 = load i32, i32 addrspace(3)* %435, align 4, !tbaa !7
  %437 = atomicrmw add i32 addrspace(1)* %433, i32 %436 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %435, align 4, !tbaa !7
  %438 = getelementptr inbounds i32, i32 addrspace(1)* %357, i64 2112
  %439 = add nuw nsw i32 %13, 2112
  %440 = getelementptr inbounds [1088 x i32], [1088 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localMasses, i32 0, i32 %439
  %441 = load i32, i32 addrspace(3)* %440, align 4, !tbaa !7
  %442 = atomicrmw add i32 addrspace(1)* %438, i32 %441 syncscope("agent-one-as") monotonic, align 4
  store i32 0, i32 addrspace(3)* %440, align 4, !tbaa !7
  %443 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %356
  %444 = getelementptr inbounds [64 x i32], [64 x i32] addrspace(3)* @_ZZ13findCentroidsPiiS_S_PjE11localCounts, i32 0, i32 %13
  %445 = load i32, i32 addrspace(3)* %444, align 4, !tbaa !7
  %446 = atomicrmw add i32 addrspace(1)* %443, i32 %445 syncscope("agent-one-as") monotonic, align 4
  br label %447

447:                                              ; preds = %355, %354
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: argmemonly nounwind willreturn
declare i32 @llvm.amdgcn.atomic.inc.i32.p3i32(i32 addrspace(3)* nocapture, i32, i32 immarg, i32 immarg, i1 immarg) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
